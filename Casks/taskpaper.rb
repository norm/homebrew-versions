cask 'taskpaper' do
  version '1.0'
  sha256 '45f4c0715990580a9b7ba716089fcf03e5423ebdd849e4761c5e33d7fe6a6a99'

  url "https://www.taskpaper.com/assets/app/TaskPaper-#{version}.zip"
  name 'TaskPaper'
  homepage 'https://www.taskpaper.com/'

  app "TaskPaper-#{version}.app"
end
