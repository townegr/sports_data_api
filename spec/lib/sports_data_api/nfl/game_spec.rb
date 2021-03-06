require 'spec_helper'

describe SportsDataApi::Nfl::Game, vcr: {
    cassette_name: 'sports_data_api_nfl_game',
    record: :new_episodes,
    match_requests_on: [:host, :path]
} do
  let(:season) do
    SportsDataApi.set_key(:nfl, api_key(:nfl))
    SportsDataApi.set_access_level(:nfl, 't')
    SportsDataApi::Nfl.schedule(2012, :REG)
  end
  let(:boxscore) do
    SportsDataApi.set_key(:nfl, api_key(:nfl))
    SportsDataApi.set_access_level(:nfl, 't')
    SportsDataApi::Nfl.boxscore(2012, :REG, 9, 'IND', 'MIA')
  end
  let(:weekly_schedule) do
    SportsDataApi.set_access_level(:nfl, 't')
    SportsDataApi.set_key(:nfl, api_key(:nfl))
    SportsDataApi::Nfl.weekly(2012, :PRE, 1)
  end
  context 'results from schedule fetch' do
    subject { season.weeks.first.games.first }
    it { should be_an_instance_of(SportsDataApi::Nfl::Game) }
    its(:id) { should eq '8c0bce5a-7ca2-41e5-9838-d1b8c356ddc3' }
    its(:scheduled) { should eq Time.new(2012, 9, 5, 19, 30, 00, '-05:00') }
    its(:home) { should eq 'NYG' }
    its(:away) { should eq 'DAL' }
    its(:status) { should eq 'closed' }
    its(:home_team) { should be_an_instance_of(SportsDataApi::Nfl::Team) }
    its(:away_team) { should be_an_instance_of(SportsDataApi::Nfl::Team) }
    its(:venue) { should be_an_instance_of(SportsDataApi::Nfl::Venue) }
    its(:broadcast) { should be_an_instance_of(SportsDataApi::Nfl::Broadcast) }
    its(:weather) { should be_an_instance_of(SportsDataApi::Nfl::Weather) }
    it '#statistics' do
      expect { subject.statistics }.to raise_error(NotImplementedError)
    end
    it '#summary' do
      expect { subject.summary }.to raise_error(NotImplementedError)
    end
    it '#pbp' do
      expect { subject.pbp }.to raise_error(NotImplementedError)
    end
    it '#roster' do
      expect { subject.roster }.to raise_error(NotImplementedError)
    end
    it '#injuries' do
      expect { subject.injuries }.to raise_error(NotImplementedError)
    end
    it '#depthchart' do
      expect { subject.depthchart }.to raise_error(NotImplementedError)
    end
    its(:boxscore) { should be_an_instance_of(SportsDataApi::Nfl::Game) }
  end
  context 'results from boxscore fetch' do
    subject { boxscore }
    it { should be_an_instance_of(SportsDataApi::Nfl::Game) }
    its(:id) { should eq '55d0b262-98ff-49fa-95c8-5ab8ec8cbd34' }
    its(:scheduled) { should eq Time.new(2012, 11, 4, 18, 00, 00, '+00:00') }
    its(:home) { should eq 'IND' }
    its(:away) { should eq 'MIA' }
    its(:status) { should eq 'closed' }
    its(:quarter) { should eq 4 }
    its(:clock) { should eq ':00' }
    its(:home_team) { should be_an_instance_of(SportsDataApi::Nfl::Team) }
    its(:away_team) { should be_an_instance_of(SportsDataApi::Nfl::Team) }
    its(:venue) { should be_an_instance_of(SportsDataApi::Nfl::Venue) }
    its(:broadcast) { should be_an_instance_of(SportsDataApi::Nfl::Broadcast) }
    its(:weather) { should be_an_instance_of(SportsDataApi::Nfl::Weather) }
    it '#statistics' do
      expect { subject.statistics }.to raise_error(NotImplementedError)
    end
    it '#summary' do
      expect { subject.summary }.to raise_error(NotImplementedError)
    end
    it '#pbp' do
      expect { subject.pbp }.to raise_error(NotImplementedError)
    end
    it '#roster' do
      expect { subject.roster }.to raise_error(NotImplementedError)
    end
    it '#injuries' do
      expect { subject.injuries }.to raise_error(NotImplementedError)
    end
    it '#depthchart' do
      expect { subject.depthchart }.to raise_error(NotImplementedError)
    end
    its(:boxscore) { should be_an_instance_of(SportsDataApi::Nfl::Game) }
  end
  context 'results from weekly schedule fetch' do
    subject { weekly_schedule.first }
    it { should be_an_instance_of(SportsDataApi::Nfl::Game) }
    its(:id) { should eq '433d3222-e82d-4f14-97e2-4115579473f6' }
    its(:scheduled) { should eq Time.new(2012, 8, 9, 23, 00, 00, '+00:00') }
    its(:home) { should eq 'BUF' }
    its(:away) { should eq 'WAS' }
    its(:status) { should eq 'closed' }
    its(:quarter) { should eq 0 }
    its(:clock) { should eq nil }
    its(:home_team) { should be_an_instance_of(SportsDataApi::Nfl::Team) }
    its(:away_team) { should be_an_instance_of(SportsDataApi::Nfl::Team) }
    its(:venue) { should be_an_instance_of(SportsDataApi::Nfl::Venue) }
    its(:broadcast) { should be_an_instance_of(SportsDataApi::Nfl::Broadcast) }
    its(:weather) { should be_an_instance_of(SportsDataApi::Nfl::Weather) }
    it '#statistics' do
      expect { subject.statistics }.to raise_error(NotImplementedError)
    end
    it '#summary' do
      expect { subject.summary }.to raise_error(NotImplementedError)
    end
    it '#pbp' do
      expect { subject.pbp }.to raise_error(NotImplementedError)
    end
    it '#roster' do
      expect { subject.roster }.to raise_error(NotImplementedError)
    end
    it '#injuries' do
      expect { subject.injuries }.to raise_error(NotImplementedError)
    end
    it '#depthchart' do
      expect { subject.depthchart }.to raise_error(NotImplementedError)
    end
    its(:boxscore) { should be_an_instance_of(SportsDataApi::Nfl::Game) }
  end
end