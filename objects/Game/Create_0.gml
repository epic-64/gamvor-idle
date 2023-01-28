version = "0.0.1";

// DEBUGGING
stats = new Stats(room_width - 200, 10);

// GAME OBJECTS
player = new Player();

selected_skill = "mining";

var posX = 0;

// LEFT SIDE OF SCREEN
posX = 10;

skillsMenu = new SkillsMenu(self, player, posX, 10);

// MIDDLE OF SCREEN
posX = 200;

selectedSkillUi = new SelectedSkillUi(self, player, posX, 10);