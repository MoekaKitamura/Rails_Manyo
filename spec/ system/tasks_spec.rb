require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    # テストで使用するためのタスクを作成
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit @task
        expect(page).to have_content 'テスト'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
       # タスク一覧ページに遷移
       visit tasks_path
       # visitしたpage（タスク一覧ページ）に「タスク」という文字列が
       # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
       expect(page).to have_content 'タスク'
       # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスク(2個目)が一番上に表示される' do
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content '1個目のタスク'
        expect(task_list[1]).to have_content '2個目のタスク'
      end
    end
    context 'タスクが終了期限の降順に並んでいる場合' do
      it '終了期限が一番近いタスク(1個目)が一番上に表示される' do
        visit tasks_path(sort: "deadline")
        task_list = all('.task_row')
        expect(task_list[0]).to have_content '2個目のタスク'
        expect(task_list[1]).to have_content '1個目のタスク'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        visit @task
        expect(page).to have_content 'テスト'
       end
     end
  end
end

