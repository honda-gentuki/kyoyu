require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context 'ユーザーが新規投稿できるとき' do
      it '必須項目が正しく入力されていれば投稿できる' do
        expect(@post).to be_valid
      end
    end

    context 'ユーザーが新規投稿できないとき' do
      it 'subjectが空では投稿できない' do
        @post.subject = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('教科名を入力してください')
      end

      it 'courseが空では投稿できない' do
        @post.course = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('科目名を入力してください')
      end

      it 'unitが空では投稿できない' do
        @post.unit = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('単元名を入力してください')
      end

      it 'teaching_materialsが空では投稿できない' do
        @post.teaching_materials = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('教材名を入力してください')
      end

      it 'introduction_timeが空では投稿できない' do
        @post.introduction_time = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('導入の時間は数値で入力してください')
      end

      it 'development_timeが空では投稿できない' do
        @post.development_time = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('展開の時間は数値で入力してください')
      end

      it 'summary_timeが空では投稿できない' do
        @post.summary_time = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('まとめの時間は数値で入力してください')
      end

      it 'userが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
