require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe '#creat' do
      let(:user) { create(:user) }
      let(:content) { create(:post,user: user) }
      
      before { sign_in(:user) }

      it 'should create comment if the request is valid' do
          post post_comments_path(content), params: { comment: { content: 'this is comment' } }
          expect(content.comments.count).to eq(1)
      end
      
      it 'should not create comment if the request is invalid' do
        post post_comments_path(content), params: { comment: { content: '' } }
        expect(content.comments.count).to be_zero
    end
  end
end
