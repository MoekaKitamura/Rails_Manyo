require 'rails_helper'

RSpec.describe 'ラベル機能', type: :system do
  before do
    FactoryBot.create(:label)
    FactoryBot.create(:second_label)
    @user = FactoryBot.create(:user)
    visit new_session_path
    fill_in :session_email, with: 'general@ex.com'
    fill_in :session_password, with: 'password'
    click_button "ログイン"
  end
  describe 'ラベル登録機能' do
    context 'タスクを新規作成する際にラベルを選択すると' do
      it '詳細画面で選択したラベルが表示される' do
        visit new_task_path
        fill_in :task_task_name, with: 'タスクテスト'
        fill_in :task_to_do, with: 'ラベル登録'
        select "2021", from: :task_deadline_1i
        select "9", from: :task_deadline_2i
        select "5", from: :task_deadline_3i
        select "未着手", from: :task_status
        select "高", from: :task_priority
        check "ラベル1"
        click_button "登録する"
        expect(page).to have_content 'ラベル1'
      end
    end
    context 'ラベルを複数選択すると' do
      it '詳細画面で選択したラベルが複数表示される' do
        visit new_task_path
        fill_in :task_task_name, with: 'タスクテスト2'
        fill_in :task_to_do, with: 'ラベル複数登録'
        select "2021", from: :task_deadline_1i
        select "9", from: :task_deadline_2i
        select "6", from: :task_deadline_3i
        select "着手", from: :task_status
        select "中", from: :task_priority
        check "ラベル1"
        check "ラベル2"
        click_button "登録する"
        expect(page).to have_content 'ラベル1'
        expect(page).to have_content 'ラベル2'
      end
    end
  end
  describe 'ラベル編集機能' do
    before do
      @task = FactoryBot.create(:task, user_id: @user.id)
    end
    context 'タスク編集する画面でラベルを追加すると' do
      it '追加後のラベルが表示される' do
        visit task_path(@task.id)
        click_on "編集"
        check "ラベル1"
        click_button "更新する"
        expect(page).to have_content 'ラベル1'
      end
    end
    context 'タスク編集する画面でラベルを変更すると' do
      it '変更後のラベルが表示される' do
        visit task_path(@task.id)
        click_on "編集"
        check "ラベル1"
        click_button "更新する"
        expect(page).to have_content 'ラベル1'
        click_on "編集"
        uncheck "ラベル1"
        check "ラベル2"
        click_button "更新する"
        expect(page).to have_content 'ラベル2'
      end
    end
    context 'タスク編集する画面でラベルを解除すると' do
      it 'ラベルが解除される' do
        visit task_path(@task.id)
        click_on "編集"
        uncheck "ラベル1"
        uncheck "ラベル2"
        click_button "更新する"
        expect(page).not_to have_content 'ラベル2'
      end
    end
  end
  describe 'ラベル検索機能' do
    context 'インデックス画面でラベルで検索すると' do
      it 'そのラベルがついたタスクのみ表示される' do
        task1 = FactoryBot.create(:task, user_id: @user.id)
        task2 = FactoryBot.create(:second_task, user_id: @user.id)
        visit task_path(task1.id)
        click_on "編集"
        check "ラベル1"
        click_button "更新する"
        visit tasks_path
        select "ラベル1"
        click_on "ラベルで検索"
        expect(page).to have_content '1個目のタスク'
        expect(page).not_to have_content '2個目のタスク'
      end
    end
  end
end