
def game_hash
  final = {
    :home => {
   :team_name => "Brooklyn Nets",
             :colors => ["Black", "White"], 
             :players => 
             {"Alan Anderson" => {
              :number => 0,
              :shoe => 16, 
              :points => 22,
              :rebounds => 12,
              :assists => 12,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 1,
             },
             "Reggie Evans" => {
              :number => 30,
              :shoe => 14,
              :points => 12,
              :rebounds => 12,
              :assists => 12,
              :steals => 12,
              :blocks => 12,
              :slam_dunks => 7
             },
             "Brook Lopez" => {
              :number => 11,
              :shoe => 17,
              :points => 17,
              :rebounds => 19,
              :assists => 10,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 15,
             },
               "Mason Plumlee" => {
              :number => 1,
              :shoe => 19,
              :points => 26,
              :rebounds => 11,
              :assists => 6,
              :steals => 3,
              :blocks => 8,
              :slam_dunks => 5,
             },
               "Jason Terry" => {
              :number => 31,
              :shoe => 15,
              :points => 19,
              :rebounds => 2,
              :assists => 2,
              :steals => 4,
              :blocks => 11,
              :slam_dunks => 1,
             }
             }
  },
  :away => {
  :team_name => "Charlotte Hornets",
             :colors =>["Turquoise", "Purple"], 
             :players => 
             {"Jeff Adrien" => {
              :number => 4,
              :shoe => 18,
              :points => 10,
              :rebounds => 1,
              :assists => 1,
              :steals => 2,
              :blocks => 7,
              :slam_dunks => 2,
             },
               "Bismack Biyombo" => {
              :number => 0,
              :shoe => 16,
              :points => 12,
              :rebounds => 4,
              :assists => 7,
              :steals => 22,
              :blocks => 15,
              :slam_dunks => 10,
             },
               "DeSagna Diop" => {
              :number => 2,
              :shoe => 14,
              :points => 24,
              :rebounds => 12,
              :assists => 12,
              :steals => 4,
              :blocks => 5,
              :slam_dunks => 5,
             },
               "Ben Gordon" => {
              :number => 8,
              :shoe => 15,
              :points => 33,
              :rebounds => 3,
              :assists => 2,
              :steals => 1,
              :blocks => 1,
              :slam_dunks => 0,
             },
               "Kemba Walker" => {
              :number => 33,
              :shoe => 15,
              :points => 6,
              :rebounds => 12,
              :assists => 12,
              :steals => 7,
              :blocks => 5,
              :slam_dunks => 12,
             }
         }
      }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
      team_data[:players].each do |name, info|
      if name == player_name
        return info[:points]
      end
    end
    end
end

def shoe_size(player_name)
game_hash.each do |team, data|
data[:players].each do |name, info|
  if name == player_name
    return info[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
    game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

# def player_numbers(team)
#   array = []
#   game_hash.each do |location, team_data|
#       team_data.each do |attribute, values|
#           if attribute == :players
#             values.each do |person, data|
#               data.each do |i, x|
#                 if i == :number
#                   array.push(x)
#                 end
#               end
#             end
#           end
#       end
#   end
#   array
# end 

def player_numbers(team)
  numbers =[]
  game_hash.values.each do |keys|
    if keys[:team_name] == team
       numbers = keys[:players].values.collect {|keys| keys[:number]}
     end
   end
   numbers.sort
end

def player_stats(player_name)
  array=[]
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :players
            values.each do |person, data|
                if person == player_name
                  array.push(data )
                end
            end
          end
      end
  end
   array[0]
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.values.each do |keys|
    keys[:players].values.each do |stats|
      if stats[:shoe] > shoe
        shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end
  
def most_points_scored
    highest_score = nil
  player_with_highest_score = nil
  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if highest_score == nil || player_stats[:points] > highest_score
        highest_score = player_stats[:points]
        player_with_highest_score = player_name
      end
   end
  end
  player_with_highest_score
end

def winning_team
  score_board = {}
  game_hash.values.each do |keys|
     points = 0
     keys[:players].values.each do |stats|
       points += stats[:points]
     end
     score_board[keys[:team_name]]= points
   end
   score_board.values[0] > score_board.values[1] ? score_board.keys[0] : score_board.keys[1]
end

def player_with_longest_name
   longest = ""
  game_hash.values.each do |keys|
    keys[:players].keys.each do |name|
      if name.length > longest.length
        longest = name
      end
    end
  end
  longest
end

def long_name_steals_a_ton?
  steals = {"" => 0}
  game_hash.values.each do |keys|
     keys[:players].each do |name,stats|
       if stats[:steals] > steals.values[0]
         steals = {name => stats[:steals]}
       end
     end
   end
   player_with_longest_name == steals.keys[0]
end