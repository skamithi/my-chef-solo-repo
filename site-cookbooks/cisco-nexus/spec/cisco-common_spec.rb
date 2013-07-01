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
      let(:login) { Cisco::Nexus.new(params) }
      before do
        @session = 'This is my nexus session'
        Expect4r::Nexus.stub(:new_ssh).and_return(@session)
      end
      it 'should create a terminal session' do
        login.term_session.should == @session
      end

      it 'should not produce any errors' do
        login.errors.should be_empty
      end
    end
    context 'timezone' do
      let(:term_session) { double('term-session') }
      let!(:params) { {:user => 'myusername', :host => 'host', :passwd => 'mypass'} }
      let(:login) { Cisco::Nexus.new(params) }
      before do
        # setup stub environment
        Expect4r::Nexus.should_receive(:new_ssh).and_return(term_session)
             #login and enter the timezone
        login
      end
      context 'when provided with a valid timezone' do
        before do
          term_session.should_receive(:config)
          term_session.should_receive(:exp_send).twice.and_return('perform the time setting')
          term_session.should_receive(:to_exec)
        end

        it 'should set the correct timezone setting on the device' do
          lambda { login.set_clock('Eastern')}.should_not raise_error Cisco::Errors::TimezoneNotDefined
        end
      end
      context 'when provided with an invalid timezone' do
        before do
          term_session.should_receive(:config)
          term_session.should_receive(:to_exec)
        end
        it 'should raise an error' do
          lambda { login.set_clock('sdfdf') }.should  raise_error Cisco::Errors::TimezoneInvalid
        end
      end
      context 'when provided with empty timezone' do
        it 'should raise an error' do
          lambda { login.set_clock('') }.should  raise_error Cisco::Errors::TimezoneNotDefined
        end
      end
    end
  end
end
