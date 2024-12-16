SELECT jc.[JOB_ID]
      , DATEDIFF(MINUTE, START_TIME, END_TIME) as EXECUTION_TIME
      , m.METRIC_VALUE AS RECORD_COUNT
      , jc.[TABLE_ID]
      , jc.[TABLE_NAME]
      , jc.[SYSTEM_NAME]
      , jc.[START_TIME]
      , jc.[END_TIME]
      , jc.[STATUS]
      , jc.[RETURN_CODE]
      , jc.[STATUS_MESSAGE]
      , jc.[OBJECT_ID]
      , jc.[OBJECT_TYPE]
      , jc.[OBJECT_DESCRIPTION]
      , jc.[OBJECT_FUNCTION_TYPE]
      , jc.[CREATION_DATE]
      , jc.[CREATOR]
      , jc.[LAST_UPDATE_DATE]
      , jc.[LAST_UPDATED_BY]
      , jc.[JOB_GROUP_ID]
      , jc.[JOB_ITEM_ID]
  FROM [db_name].[rpm].[JOB_CONTROL] jc
  JOIN [db_name].[rpm].[JOB_METRIC] m
    ON jc.JOB_ID = m.JOB_ID
  JOIN [db_name].[rpm].[JOB_METRIC_TYPE] mt
    ON m.METRIC_TYPE_ID = mt.METRIC_TYPE_ID 
    AND m.METRIC_TYPE_ID = 1
  WHERE SYSTEM_NAME = 'XYZ'
  AND START_TIME > GETDATE()-1
  AND STATUS = 3
  ORDER BY START_TIME DESC;