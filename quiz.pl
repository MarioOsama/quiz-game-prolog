% Define the questions
question('What is the capital of France?', 'Paris').
question('What is the highest mountain in the world?', 'Mount Everest').
question('What is the largest continent by area?', 'Asia').
question('What is the smallest country in the world?', 'Vatican City').
question('What is the capital of France?', 'Paris').
question('What is the capital of Germany?', 'Berlin').
question('What is the capital of Italy?', 'Rome').
question('What is the highest mountain in the world?', 'Mount Everest').
question('What is the largest country in the world?', 'Russia').
question('What is the largest continent by area?', 'Asia').
question('What is the smallest country in the world?', 'Vatican City').
question('Who wrote the novel "Pride and Prejudice"?', 'Jane Austen').
question('How many planets are in our solar system?', '8').
question('What is the name of the biggest technology company in South Korea?', 'Samsung').
question('What is the name of the biggest technology company in the United States?', 'Apple').
question('What is the name of the biggest technology company in China?', 'Huawei').
question('Who is the main character in the Harry Potter series?', 'Harry Potter').
question('What is the name of the largest ocean in the world?', 'Pacific Ocean').
question('What is the name of the largest sea in the world?', 'South China Sea').
question('Who invented the light bulb?', 'Thomas Edison').
question('What is the name of the currency used in the United States?', 'US dollar').
question('What is the name of the currency used in the United Kingdom?', 'Pound sterling').
question('What is the name of the currency used in Japan?', 'Yen').
question('What is the name of the character who lives in a pineapple under the sea in a popular animated TV show?', 'SpongeBob').
question('What is the top-selling electric car model as of 2021?', 'Tesla Model 3').

% Define the game loop
game_loop :-
    % Shuffle the questions
    findall(Q, question(Q, _), Questions),
    random_permutation(Questions, ShuffledQuestions),
    % Loop through the questions
    write('Please put single quotation marks in your answer, followed by a full stop.'), nl,
    score_loop(ShuffledQuestions, 0, Score),
    % End of game
    game_over(Score).

% Define the score loop
score_loop([], Score, Score).
score_loop([Question|RestQuestions], ScoreIn, ScoreOut) :-
    % Ask the question
    write(Question), nl,
    read(Answer),
    % Check the answer and update the score
    score(Question, Answer, Points),
    NewScore is ScoreIn + Points,
    % Show the current score
    write('Current score: '), write(NewScore), nl,
    % Loop through the next questions
    score_loop(RestQuestions, NewScore, ScoreOut).

% Define the scoring system
score(Question, Answer, Points) :-
    (question(Question, CorrectAnswer),
    Answer = CorrectAnswer ->
        Points = 1;
        Points = 0).

% Define the end of game conditions
game_over(Score) :-
    (Score >= 3 ->
        write('Congratulations! You won.'), nl;
        write('Sorry, you lost. Better luck next time.'), nl).

% Start the game
:- game_loop.
