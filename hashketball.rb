def game_hash 
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        { :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        { :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        { :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        { :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        { :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        },
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        { :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        { :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10,
        },
        { :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        { :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        { :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12,
        },
      ]
    }
  }
end         #FUck this!

def num_points_scored (name)
  teams = game_hash
  score = 0
  teams.each do
    |(team, details)|
    details[:players].each do
      |player|
      if player[:player_name] == name
        score += player[:points]
      end
    end
  end
    if score == 0
      score = "Sorry, that player didn't score."
    end
    score
end

def shoe_size(name)
  teams = game_hash
  shoe = 0
  teams.each do
    |(team, details)|
    details[:players].each do
      |player|
      if player[:player_name] == name
        shoe += player[:shoe]
      end
    end
  end
    if shoe == 0
      score = "Sorry, that player doesn't wear shoes."
    end
    shoe
end
 
def team_colors(team_name)
  teams = game_hash
  team_color = []
  teams.each do
    |(team, details)|
    if details[:team_name] == team_name
      team_color << details[:colors]
    end 
  end
    team_color = team_color.flatten
  end
    
def team_names
  teams = game_hash
  name = teams.reduce([]) do
    |memo, (team, details)|
    memo << details[:team_name]
    memo
  end
  name
end

def player_numbers (team_name)
  teams = game_hash
  numbers = teams.reduce([]) do
    |memo, (team, details)|
    if details[:team_name] == team_name
      details[:players].each do
        |(player)|
        memo << player[:number]
      end
    end
    memo
  end
  numbers
end

def player_stats (player_name)
  teams = game_hash
  stats = teams.reduce({}) do
    |memo, (team, details)|
    details[:players].each do
      |player|
      if player[:player_name] == player_name
        memo = memo.merge(player)
        memo.delete(:player_name)
      end
    end
    memo
  end
  stats
end

def big_shoe_rebounds
  teams = game_hash
  shoe = 0
  big_player = "" 
  rebound = 0
  teams.each do
    |(team, details)|
    details[:players].each do
      |player|
      if player[:shoe] > shoe
        shoe = player[:shoe]
        big_player = player[:player_name]
      end
    end
  end
  teams.each do
    |(team, details)|
    details[:players].each do
      |player|
      if player[:player_name] == big_player
        rebound = player[:rebounds]
      end
    end
  end
  rebound
end

def most_points_scored
  teams = game_hash
  score = 0
  big_player = "" 
  teams.each do
    |(team, details)|
    details[:players].each do
      |player|
      if player[:points] > score
        score = player[:points]
        big_player = player[:player_name]
      end
    end
  end
  big_player
end

def winning_team
  teams = game_hash
  team_score = teams.reduce({}) do
    |memo, (team, details)|
    details[:players].each do
        |(player)|
        if !memo[details[:team_name]]
          memo[details[:team_name]] = 0
        end
        memo[details[:team_name]] += player[:points]
      end
    memo
  end
  
  high = 0
  winner = ""
  team_score.each do
    |(team, score)|
    if score > high
      high = score
      winner = team
    end
  end
  winner
end     

def player_with_longest_name
  teams = game_hash
  name_length = 0
  big_player = "" 
  teams.each do
    |(team, details)|
    details[:players].each do
      |player|
      if player[:player_name].length > name_length
        name_length = player[:player_name].length
        big_player = player[:player_name]
      end
    end
  end
  big_player
end

def long_name_steals_a_ton?
  def most_steals
    teams = game_hash
    steals = 0
    big_player = "" 
    teams.each do
      |(team, details)|
      details[:players].each do
        |player|
        if player[:steals] > steals
          steals = player[:steals]
          big_player = player[:player_name]
        end
      end
    end
    big_player
  end
  most_steals == player_with_longest_name
end