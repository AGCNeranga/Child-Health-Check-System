% BMI calculation
bmi_calculator(Name, Age, Gender, Height, Weight, BMI) :-
    Height_m is Height / 100,
    BMI is Weight / (Height_m * Height_m).

% Child Health status
health_status(BMI, Status) :-
    BMI < 18.5,
    Status = 'underweight'.
health_status(BMI, Status) :-
    BMI >= 18.5, BMI < 25,
    Status = 'normal weight'.
health_status(BMI, Status) :-
    BMI >= 25,
    Status = 'overweight'.

% child Calories in food item
calories('fish', 52).
calories('chicken', 220).
calories('carrot', 41).
calories('cheeseburger', 300).
calories('chicken breast', 165).
calories('french fries', 312).
calories('green salad', 15).
calories('hamburger', 250).
calories('ice cream', 137).
calories('grapes', 62).
calories('chocolate', 200).

% Child Weight recommendations
weight_recommendations('underweight', 'gain weight') :-
    write('Your child is underweight. To gain weight, they should consume more calories than they burn.\n\n'),
    write('Recommendations:\n'),
    write('- Eat more frequently throughout the day\n'),
    write('- Consume calorie-dense foods such as nuts, avocados, and cheese\n'),
    write('- Drink high-calorie beverages like smoothies and milkshakes\n\n').
weight_recommendations('normal weight', 'maintain weight') :-
    write('Your child is at a healthy weight. To maintain their weight, they should consume the same amount of calories that they burn.\n\n').
weight_recommendations('overweight', 'lose weight') :-
    write('Your child is overweight. To lose weight, they should consume fewer calories than they burn.\n\n'),
    write('Recommendations:\n'),
    write('- Reduce portion sizes\n'),
    write('- Limit consumption of high-calorie, low-nutrient foods\n'),
    write('- Increase physical activity\n\n').

% Main predicate for child health System
health_check :-
    write('Welcome to the Child Health Check System!\n\n'),
    write('Please enter your child\'s information below:\n\n'),
    write('Enter your child''s Name: '),
    read(Name),
    write('Enter your child''s Age: '),
    read(Age),
    write('Enter your child''s Gender: '),
    read(Gender),
    write('Enter your child''s Height (in cm): '),
    read(Height),
    write('Enter your child''s Weight (in kg): '),
    read(Weight),
    bmi_calculator(Name, Age, Gender, Height, Weight, BMI),
    health_status(BMI, Status),
    format('Your child''s BMI is : ~2f~n', BMI),
    format('Your child''s health status is : ~w~n~n', Status),
    write('Would you like to get recommendations according to the result? (yes/no): '),
    read(Answer),
    (Answer == 'yes' ->
        weight_recommendations(Status, WeightRecommendation),
        format('Your child should ~w to reach a healthier weight.\n', WeightRecommendation);
        write('Thank you for using the Child Health Check program!\n')
    ),
    write('Please enter a food item to check its calorie count: '),
    read(FoodItem),
    (calories(FoodItem, Cal) ->
        format('~w contains ~d calories.\n', [FoodItem, Cal]);
        write('Invalid food item entered.\n')
    ).
