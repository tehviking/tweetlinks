require 'spec_helper'

describe Api::LinksController do
  let(:user) { Fabricate(:user) }
  let(:link) { Fabricate(:link) }
  before { link } # initialize it

  describe 'GET index' do
    before { get :index }
    subject { JSON.parse response.body }

    it 'wraps around links' do should include 'links' end

    it 'returns http 200' do
      response.response_code.should == 200
    end
  end

  describe 'GET show' do
    context 'unauthorized' do
      before { get :show, id: link.id }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'authorized' do
      before do
        user.ensure_authentication_token!
        get :show, id: link.id, auth_token: user.authentication_token
      end
      subject { JSON.parse response.body }

      it 'wraps around link' do should include 'link' end
      context 'inside link' do
        subject { (JSON.parse response.body)['link'] }
        it { should include 'id' }
        it { should include 'param' }
      end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end
end