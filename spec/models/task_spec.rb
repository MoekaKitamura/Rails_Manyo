require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(task_name: '', to_do: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(task_name: 'test', to_do: '')
        expect(task).not_to be_valid
      end  
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(task_name: 'test', to_do: '成功テスト')
        expect(task).to be_valid
      end
    end
  end

  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    before do
      # テストで使用するためのタスクを作成
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      
    end
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        sleep 5
        
        expect(Task.task_name('1')).to have_content("1個目のタスク")
        expect(Task.task_name('1')).not_to have_content("2個目のタスク")
        expect(Task.task_name('1').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # ここに内容を記載する
        expect(Task.status('未着手')).to have_content("1個目のタスク")
        expect(Task.status('未着手')).not_to have_content("2個目のタスク")
        expect(Task.status('未着手').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # ここに内容を記載する
        expect(Task.task_name('2').status('完了')).to have_content("2個目のタスク")
        expect(Task.task_name('2').status('完了')).not_to have_content("1個目のタスク")
        expect(Task.task_name('2').status('完了').count).to eq 1
      end
    end
  end

end