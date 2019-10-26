def game_hash
    home_team_name = 'Brooklyn Nets'
    home_team_color = ['Black', 'White']
    array_home_players = [
      {player: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},   
      {player: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},   
      {player: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}   
    ]
  
    away_team_name = 'Charlotte Hornets'
    away_team_color = ['Turquoise', 'Purple']
    array_away_players = [
      {player: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player: 'Bismack Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},  
      {player: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},  
      {player: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},  
      {player: 'Kemba Walker', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12},   
    ]
  
  
    game_hash = {
      home: {team_name: home_team_name, colors: home_team_color, players: array_home_players},
      away: {team_name: away_team_name, colors: away_team_color, players: array_away_players}
      }
  end
  
  def num_points_scored(player_name)
    points_scored = {
      'Alan Anderson' => 22,
      'Reggie Evans' => 12,
      'Brook Lopez' => 17,
      'Mason Plumlee' => 26,
      'Jason Terry' => 19,
      'Jeff Adrien' => 10,
      'Bismack Biyombo' => 12,
      'DeSagna Diop' => 24,
      'Ben Gordon' => 33,
      'Kemba Walker' => 6 
    }
    points_scored[player_name]
  end
  
  def shoe_size(player_name)
    shoe_size = {
      'Alan Anderson' => 16,
      'Reggie Evans' => 14,
      'Brook Lopez' => 17,
      'Mason Plumlee' => 19,
      'Jason Terry' => 15,
      'Jeff Adrien' => 18,
      'Bismack Biyombo' => 16,
      'DeSagna Diop' => 14,
      'Ben Gordon' => 15,
      'Kemba Walker' => 15 
    }
    shoe_size[player_name]
  end
  
  def team_colors(team_name)
    home_team_name = 'Brooklyn Nets'
    home_team_color = ['Black', 'White']
  
    away_team_name = 'Charlotte Hornets'
    away_team_color = ['Turquoise', 'Purple']
  
    if team_name == home_team_name
      return home_team_color
    else
      return away_team_color
    end
  end
  
  
  def team_names
    teams = ['Brooklyn Nets', 'Charlotte Hornets']
  end
  
  
def player_numbers(team_name)
    home_team_name = 'Brooklyn Nets'
    away_team_name = 'Charlotte Hornets'
    player_numbers = []
    count = 0
    
    home_team = [
      {player: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},   
      {player: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},   
      {player: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}   
    ]
  
    away_team = [
      {player: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player: 'Bismack Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},  
      {player: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},  
      {player: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},  
      {player: 'Kemba Walker', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12},   
    ]
  
    if team_name == home_team_name
      while count < 5 do
        player_numbers << home_team[count][:number]
        count += 1
      end
    else
      while count < 5 do
        player_numbers << away_team[count][:number]
        count += 1
      end
    end
    return player_numbers
end
  
  
  
  
  def player_stats(player_name)
    player_stats = {
      'Alan Anderson' => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      'Reggie Evans' => { number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      'Brook Lopez' => { number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},   
      'Mason Plumlee' => { number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},   
      'Jason Terry' => { number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1},
      'Jeff Adrien' => { number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      'Bismack Biyombo' => { number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},  
      'DeSagna Diop' => { number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},  
      'Ben Gordon' => { number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},  
      'Kemba Walker' => { number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12},
    }
  
    player_stats[player_name]
  end
  
  
  def big_shoe_rebounds
  shoe_size = {
    'Alan Anderson' => 16,
    'Reggie Evans' => 14,
    'Brook Lopez' => 17,
    'Mason Plumlee' => 19,
    'Jason Terry' => 15,
    'Jeff Adrien' => 18,
    'Bismack Biyombo' => 16,
    'DeSagna Diop' => 14,
    'Ben Gordon' => 15,
    'Kemba Walker' => 15 
  }

  rebounds = {
    'Alan Anderson' => 12,
    'Reggie Evans' => 12,
    'Brook Lopez' => 19,   
    'Mason Plumlee' => 11,   
    'Jason Terry' => 2,
    'Jeff Adrien' => 1,
    'Bismack Biyombo' => 4,
    'DeSagna Diop' => 12,  
    'Ben Gordon' => 3,
    'Kemba Walker' => 12
  }

  sorted_shoe_size = shoe_size.sort_by {|name, size| size}
  player_big_shoe = sorted_shoe_size[-1][0]
  num_rebound = rebounds[player_big_shoe]
  
  

  return num_rebound
end