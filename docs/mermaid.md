# mermaid

mermaid test

```{.mermaid format=svg}
gantt
    dateFormat  YYYY-MM-DD
    title       Adding GANTT diagram functionality to mermaid
    excludes    weekends
    %% (`excludes` accepts specific dates in YYYY-MM-DD format, days of the week ("sunday") or "weekends", but not the word "weekdays".)

    section A section
    Completed task            :done,    des1, 2014-01-06,2014-01-08
    Active task               :active,  des2, 2014-01-09, 3d
    Future task               :         des3, after des2, 5d
    Future task2              :         des4, after des3, 5d

    section Critical tasks
    Completed task in the critical line :crit, done, 2014-01-06,24h
    Implement parser and jison          :crit, done, after des1, 2d
    Create tests for parser             :crit, active, 3d
    Future task in critical line        :crit, 5d
    Create tests for renderer           :2d
    Add to mermaid                      :1d
    Functionality added                 :milestone, 2014-01-25, 0d

    section Documentation
    Describe gantt syntax               :active, a1, after des1, 3d
    Add gantt diagram to demo page      :after a1  , 20h
    Add another diagram to demo page    :doc1, after a1  , 48h

    section Last section
    Describe gantt syntax               :after doc1, 3d
    Add gantt diagram to demo page      :20h
    Add another diagram to demo page    :48h
```

注意，这里使用svg格式，pandoc生成的图像缺失文字：

```{.mermaid}
gitGraph:
options
{
    "nodeSpacing": 80,
    "nodeRadius": 6
}
end
commit
branch dev
checkout dev
commit
branch feat
checkout feat
commit
commit
commit
checkout dev
commit
merge feat
checkout master
commit
merge dev
```

```{.mermaid format=svg}
gitGraph:
options
{
    "nodeSpacing": 80,
    "nodeRadius": 6
}
end
commit
branch dev
checkout dev
commit
branch feat
checkout feat
commit
commit
commit
checkout dev
commit
merge feat
checkout master
commit
merge dev
```

```{.mermaid format=svg}
sequenceDiagram
    participant User
    participant Client
    participant Server
    
    User->>Client: input username/password
    Client->>Server: GET /auth/pre?type=password
    Server-->>Client: create session, include steps
    Client->>Server:  POST /auth/password/verify
    Server-->>Client: check and no next step auth
    Client-->>User: Logged in successfully
```
