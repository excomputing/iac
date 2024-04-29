<br>

## EventBridge Schedules

[EventBridge Scheduler & Schedule Types](https://docs.aws.amazon.com/scheduler/latest/UserGuide/schedule-types.html)

<br>

### Create

Start [from scratch](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/scheduler/create-schedule.html), or edit the details of [an existing schedule](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/scheduler/get-schedule.html):

```shell
aws scheduler get-schedule --group-name environment --name DailyTaskSchedule --output json --region eu-west-1 > schedule.json
```

or

```shell
 aws scheduler get-schedule --group-name environment --name DailyTaskSchedule --output yaml --region eu-west-1 > schedule.yaml
```

Next, adapt the `yaml` or `json` script in line with schedule requirements.  Subsequently, [create](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/scheduler/create-schedule.html) a new schedule

```shell
aws scheduler create-schedule --cli-input-yaml {input.file}
```

<br>
<br>

### Delete

> [!NOTE]
> Upcoming

[Delete](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/scheduler/delete-schedule.html)

<br>
<br>

## References

Beware of the different cron syntax types

[Amazon EventBridge Syntax](https://docs.aws.amazon.com/scheduler/latest/UserGuide/schedule-types.html#cron-based)
[Baeldung Cron Expressions](https://www.baeldung.com/cron-expressions)
[CronHub Syntax](https://crontab.cronhub.io)
[Cronitor Syntax](https://crontab.guru)

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
