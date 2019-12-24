def game_hash
  game_hash = {}
  game_hash[:home] = {:team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => []
  }
  game_hash[:away] = {:team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => []
  }
  game_hash[:home][:players] << {:player_name => "Alan Anderson",
  :number => 0,
  :shoe => 16,
  :points => 22,
  :rebounds => 12,
  :assists => 12,
  :steals => 3,
  :blocks => 1,
  :slam_dunks => 1
  }
  game_hash[:home][:players] << {:player_name => "Reggie Evans",
  :number => 30,
  :shoe => 14,
  :points => 12,
  :rebounds => 12,
  :assists => 12,
  :steals => 12,
  :blocks => 12,
  :slam_dunks => 7
  }
  game_hash[:home][:players] << {:player_name => "Brook Lopez",
  :number => 11,
  :shoe => 17,
  :points => 17,
  :rebounds => 19,
  :assists => 10,
  :steals => 3,
  :blocks => 1,
  :slam_dunks => 15
  }
  game_hash[:home][:players] << {:player_name => "Mason Plumlee",
  :number => 1,
  :shoe => 19,
  :points => 26,
  :rebounds => 11,
  :assists => 6,
  :steals => 3,
  :blocks => 8,
  :slam_dunks => 5
  }
  game_hash[:home][:players] << {:player_name => "Jason Terry",
  :number => 31,
  :shoe => 15,
  :points => 19,
  :rebounds => 2,
  :assists => 2,
  :steals => 4,
  :blocks => 11,
  :slam_dunks => 1
  }
  game_hash[:away][:players] << {:player_name => "Jeff Adrien",
  :number => 4,
  :shoe => 18,
  :points => 10,
  :rebounds => 1,
  :assists => 1,
  :steals => 2,
  :blocks => 7,
  :slam_dunks => 2
  }
  game_hash[:away][:players] << {:player_name => "Bismack Biyombo",
  :number => 0,
  :shoe => 16,
  :points => 12,
  :rebounds => 4,
  :assists => 7,
  :steals => 22,
  :blocks => 15,
  :slam_dunks => 10
  }
  game_hash[:away][:players] << {:player_name => "DeSagna Diop",
  :number => 2,
  :shoe => 14,
  :points => 24,
  :rebounds => 12,
  :assists => 12,
  :steals => 4,
  :blocks => 5,
  :slam_dunks => 5
  }
  game_hash[:away][:players] << {:player_name => "Ben Gordon",
  :number => 8,
  :shoe => 15,
  :points => 33,
  :rebounds => 3,
  :assists => 2,
  :steals => 1,
  :blocks => 1,
  :slam_dunks => 0
  }
  game_hash[:away][:players] << {:player_name => "Kemba Walker",
  :number => 33,
  :shoe => 15,
  :points => 6,
  :rebounds => 12,
  :assists => 12,
  :steals => 7,
  :blocks => 5,
  :slam_dunks => 12
  }
  game_hash
end

def num_points_scored(player)
  empty_array = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if value_2 == player
        empty_array << value_1
        break
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if value_2 == player
        empty_array << value_1
        break
      end
    end
  end  
  empty_array[0][:points]
end

def shoe_size(player)
  empty_array = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if value_2 == player
        empty_array << value_1
        break
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if value_2 == player
        empty_array << value_1
        break
      end
    end
  end  
  empty_array[0][:shoe]
end    

def team_colors(team_name)
  empty_array = []
  game_hash.each do |ovrkey, value|
    value.each do |bigkey, value_1|
      if value_1 == team_name
        empty_array << value
      end
    end
  end
  empty_array[0][:colors]
end    

def team_names
  empty_array = []
  empty_array << game_hash[:home][:team_name]
  empty_array << game_hash[:away][:team_name]
  empty_array
end

def player_numbers(team_name)
  empty_array = []
  if team_name == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |value_1|
      value_1.each do |key, value_2|
        if key == :number
          empty_array << value_2
        end
      end
    end
  elsif team_name == game_hash[:away][:team_name]
    game_hash[:away][:players].each do |value_1|
      value_1.each do |key, value_2|
        if key == :number
          empty_array << value_2
        end
      end
    end
  end
  empty_array
end

def player_stats(player)
  empty_array = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if value_2 == player
        empty_array << value_1
        break
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if value_2 == player
        empty_array << value_1
        break
      end
    end
  end  
  empty_array[0].delete(:player_name)
  empty_array[0]
end

def most_points_scored
  empty_array = []
  shoe_size = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :points
        shoe_size << value_2
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :points
        shoe_size << value_2
      end
    end
  end  
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :points
        if shoe_size.max == value_2
          empty_array << value_1
          break
        end
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :points
        if shoe_size.max == value_2
          empty_array << value_1
          break
        end
      end
    end
  end
  empty_array[0][:player_name]
end

def big_shoe_rebounds
  empty_array = []
  shoe_size = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :shoe
        shoe_size << value_2
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :shoe
        shoe_size << value_2
      end
    end
  end  
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :shoe
        if shoe_size.max == value_2
          empty_array << value_1
          break
        end
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :shoe
        if shoe_size.max == value_2
          empty_array << value_1
          break
        end
      end
    end
  end
  empty_array[0][:rebounds]
end


def winning_team
  shoe_size_1 = []
  shoe_size_2 = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :points
        shoe_size_1 << value_2
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :points
        shoe_size_2 << value_2
      end
    end
  end  
  if shoe_size_1.sum > shoe_size_2.sum
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  shoe_size = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :player_name
        shoe_size << value_2
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :player_name
        shoe_size << value_2
      end
    end
  end
  longest_player_name = shoe_size.max { |a, b| a.length <=> b.length }
  longest_player_name
end

def long_name_steals_a_ton?
  rebound_array = []
  player_array = []
  shoe_size = []
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :player_name
        shoe_size << value_2
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :player_name
        shoe_size << value_2
      end
    end
  end
  longest_player_name = shoe_size.max { |a, b| a.length <=> b.length }
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :steals
        rebound_array << value_2
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :steals
        rebound_array << value_2
      end
    end
  end
  game_hash[:home][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :steals
        if value_2 == rebound_array.max
          player_array << value_1
          break
        end
      end
    end
  end
  game_hash[:away][:players].each do |value_1|
    value_1.each do |key, value_2|
      if key == :steals
        if value_2 == rebound_array.max
          player_array << value_1 
          break
        end
      end
    end
  end
  if longest_player_name == player_array[0][:player_name]
    return TRUE
  else
    return FALSE
  end
end