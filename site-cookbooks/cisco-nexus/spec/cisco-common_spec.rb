require 'spec_helper.rb'

describe 'Cisco' do
  context 'Nexus' do
    context 'login' do
      let(:action) { Cisco::Nexus.new }
      subject { action.errors }
      its([:user]) { should_not be_empty }
      its([:host]) { should_not be_empty }
      its([:passwd]) { should_not be_empty }
    end
    context 'successful login' do
      let!(:params) { {:user => 'myusername', :host => 'host', :passwd => 'mypass'} }
      let(:action) { Cisco::Nexus.new(params) }
      before do
        @session = 'This is my nexus session'
        Expect4r::Nexus.stub(:new_ssh).and_return(@session)
      end
      it 'should create a terminal session' do
        action.term_session.should == @session
      end

      it 'should not produce any errors' do
        action.errors.should be_empty
      end
    end

  end
end
