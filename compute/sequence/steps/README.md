<br>

### Notes

* [Step Functions](https://docs.aws.amazon.com/step-functions)
  * [cli](https://docs.aws.amazon.com/cli/latest/reference/stepfunctions/#cli-aws-stepfunctions)
  * [asl](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html)
* [Step Functions & Fargate Tasks](https://docs.aws.amazon.com/step-functions/latest/dg/connect-ecs.html)
* [Standard/Express](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-standard-vs-express.html)


<br>

### Creating & Deploying a State Machine


> [!Note]
> start the state machine
> aws stepfunctions start-execution --state-machine-arn arn:aws:states:eu-west-1:646117807760:stateMachine:InitialTask
> aws stepfunctions start-execution --state-machine-arn arn:aws:states:eu-west-1:646117807760:stateMachine:SequenceOfTasks

> [!Note]
> create a state machine
aws stepfunctions create-state-machine --name Alternative --role-arn arn:aws:iam::646117807760:role/StepFunctionsRoleDefault --definition file://src/steps/0002/machine.asl.json

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
