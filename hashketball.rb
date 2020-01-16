require "pry"

# MORE CLEANING IDEAS
# 1. move game hash data into a yaml

def game_hash
  big_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => %w[Black White],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => %w[Turquoise Purple],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]  
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

## METHDODS THAT DO THE REAL LABOR
def find_player(name)
  # returns the hash of a player, given the name as a string
  player = {}
  # Run expressions for Home and Away teams
  game_hash.each do |location, team_data|
    # set variable to player with matching name. If none, it returns nil
    player = team_data[:players].find { |player_hash| 
      player_hash[:player_name] == name }
    
    # if player is not nil, it means we've already found a match and should not run find on the other team
    if player != nil
      return player
    end
    
  end
  player
end

def find_team(team_name)
  # Looks at game_hash. Each of the two teams (home and away)
  # Returns the hash for the team with that team name
  team_hash_as_array = game_hash.find { |key, value|
    value[:team_name] == team_name
  }
  team_hash_as_array[1]
end

def player_most(statistic)
  # return the the player that has the most of the statistic parameter.
  
  player = {}
  max_per_team = []
  i = 0
  
  # Run expressions for Home and Away teams
  game_hash.each { |location, team_data|
    # collect hashes of players on each team with largest shoe
    max_per_team[i] = team_data[:players].max { |a, b| a[statistic] <=> b[statistic] }
    i += 1
  }
  player = max_per_team.max { |a, b| a[statistic] <=> b[statistic] }
end


## METHODS THAT PRIMARILY CALL OTHER METHODS
def num_points_scored(name)
  find_player(name)[:points]
end

def shoe_size(name)
  # returns the shoe size for that player
  find_player(name)[:shoe]
end

def team_colors(team_name)
  # returns an array of that teams colors
  find_team(team_name)[:colors]
end

def player_numbers(team_name)
  # returns an array of the jersey number's for that team.
  numbers = find_team(team_name)[:players].collect { |player|
    player[:number]
  }
end

def player_stats(name)
  # returns a hash of that player's stats
  stats_hash = find_player(name)
  
  # the tests don't want us to include the player name in the returned hash
  stats_hash.delete(:player_name)
  
  stats_hash
end

def big_shoe_rebounds
  # return the number of rebounds associated with the player that has the largest shoe size.
  player_most(:shoe)[:rebounds]
end

## MISC NON BONUS
def team_names
  # return an array of the team names
  i = 0
  return_array = []
  
  game_hash.each { |location, team_data| 
    return_array[i] = team_data[:team_name] 
    i += 1
  }
  return_array
end


## BONUS SECTION

def most_points_scored
  player_most(:points)[:player_name]
end

def winning_team
  # create array of hashes with summary data: team name and total points
  summary = game_hash.reduce([]) { |new_hash, (location, team_data)|
    new_hash.push({
      :team_name => team_data[:team_name], 
      :score => team_data[:players].sum { |player| player[:points] }
    })
    new_hash
  }
  
  winner = summary.max { |a, b| a[:score] <=> b[:score] }
  winner[:team_name]
end

def player_with_longest_name
   # return the the player that has the most of the statistic parameter.
  
  player = {}
  max_per_team = []
  i = 0
  
  # Run expressions for Home and Away teams
  game_hash.each { |location, team_data|
    # collect hashes of players on each team with largest shoe
    max_per_team[i] = team_data[:players].max { |a, b| a[:player_name].length <=> b[:player_name].length }
    i += 1
  }
  player = max_per_team.max { |a, b| a[:player_name].length <=> b[:player_name].length }
  player[:player_name]
end

def long_name_steals_a_ton?
  player_with_longest_name == player_most(:steals)[:player_name] ? true : false
end


most_points_scored
winning_team
player_with_longest_name
long_name_steals_a_ton?




