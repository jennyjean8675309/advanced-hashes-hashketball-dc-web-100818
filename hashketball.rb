# Write your code here!
require 'rb-readline'
require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        'Alan Anderson': {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        'Reggie Evans': {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez': {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        'Mason Plumlee': {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        'Jason Terry': {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien': {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo': {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop': {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        'Ben Gordon': {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood': {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  player_points = []
  game_hash.each do |h_or_a, individual_team_info|
    individual_team_info.each do |tcp, stats|
      if tcp == :players && stats.include?(name.to_sym)
        player_points << game_hash[h_or_a][:players][name.to_sym][:points]
      end
    end
  end

  player_points[0]
end


def shoe_size(name)
  shoe_size = []

  game_hash.each do |location, team_info|
    team_info.each do |attribute, stats|
      if attribute == :players && stats.include?(name.to_sym)
        shoe_size << game_hash[location][:players][name.to_sym][:shoe]
      end
    end
  end

  shoe_size[0]
end


def team_colors(name)
  colors = []

  game_hash.each do |location, team_info|
    if team_info[:team_name] == name
      colors << game_hash[location][:colors]
    end
  end

  colors[0]
end


def team_names
  names = []

  game_hash.each do |location, team_info|
    names << game_hash[location][:team_name]
  end

  names
end


def player_numbers(name)
  players = []
  numbers = []

  game_hash.each do |location, team_info|
    if team_info[:team_name] == name
      players << game_hash[location][:players]
    end
  end

  players[0].each do |player, stats|
    numbers << stats[:number]
  end

  numbers
end


def player_stats(name)
  stats = []

  game_hash.each do |location, team_info|
    team_info.each do |attribute, data|
      if attribute == :players && data.include?(name.to_sym)
        stats << game_hash[location][:players][name.to_sym]
      end
    end
  end

  stats[0]
end


def big_shoe_rebounds
  max_shoe = 0
  max_shoe_rebounds = 0

  game_hash.each do |location, team_info|
    team_info.each do |attribute, team_data|
      if attribute == :players
        team_data.each do |player, stats|
          if stats[:shoe] > max_shoe
            max_shoe = stats[:shoe]
            max_shoe_rebounds = stats[:rebounds]
          end
        end
      end
    end
  end

  max_shoe_rebounds
end

big_shoe_rebounds
