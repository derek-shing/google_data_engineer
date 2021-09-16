CREATE OR REPLACE MODEL
  'dataset.name'
OPTIONS
(model_type='linear_reg',
input_label_cols='sales',
ls_init_learn_rate=.15,
l1_reg=1,
max_iterations=5) as



# Inspect what the model learned with ML.Weights

SELECT
category, weight
From
UNNEST((
  SELECT
    category_weights
  FROM
    ML.WEIGTHS(MODEL)
))

Training Progress = select * from ML.TRAINING_INFO( MODEL 'mydataset.mymodel')

INspect Weights = select * from ML.WEIGHTS(MODEL 'mydataset.mymodel',(<query>))

Evaluation = select * from ML.EVAUATE(MODEL 'mydataset.mymodel')

Prediction = select * from ML.PREDICT(MODEL 'mydataset.mymodel',(<query>)
