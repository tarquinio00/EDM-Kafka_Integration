export $(grep -v '^#' .env | xargs)

docker exec -it app-mysql-1 bash -c "
mysql -u root -p${MYSQL_ROOT_PASSWORD} --execute \"
USE ${MYSQL_DB_TEST};
INSERT INTO NoteList VALUES (
    'test',
    '10240398',
    '353',
    'Fiat Powertrain Technologies Industrial',
    '2024-02-13 11:56:22.000000',
    '2024-02-13 12:08:51.590376',
    '{\\\"Items\\\": [
        {\\\"Product\\\": {\\\"HexColor\\\": \\\"#c4c4c2\\\", \\\"ColorCode\\\": 2, \\\"ColorText\\\": \\\"LIGHT GREY PPG 422644\\\", \\\"ProductNumberIn\\\": \\\"5802987651\\\", \\\"ProductNumberOut\\\": \\\"5802987651V\\\"}, \\\"UserName\\\": \\\"francesco.velluto\\\", \\\"CustomerCode\\\": \\\"32874\\\", \\\"IsUnknowItem\\\": false, \\\"SerialNumber\\\": \\\"001057093\\\", \\\"CreatedUtcDate\\\": \\\"2024-02-13T11:56:59.6923811Z\\\", \\\"PMSNotAvailable\\\": false, \\\"ProductionItemID\\\": \\\"8a4de1fb-eff9-47f3-b8bc-54e1991cab37\\\", \\\"CheckListEntryItem\\\": {\\\"Code\\\": \\\"DEFAULT_LEV0\\\", \\\"Date\\\": \\\"2024-02-13T11:56:57.8636938+00:00\\\", \\\"Guid\\\": \\\"a214c128-540d-4326-b062-c10a4b19d0d9\\\", \\\"Notes\\\": \\\"\\\", \\\"OpCode\\\": 1000, \\\"OpResult\\\": true, \\\"UserName\\\": \\\"francesco.velluto\\\", \\\"Checklist\\\": [{\\\"Code\\\": \\\"H001\\\", \\\"Type\\\": \\\"header\\\", \\\"Value\\\": \\\"bk_color: #AA106B; txt_color: #FFFFFF; font_size: 32;\\\", \\\"Description\\\": \\\"Checklist accettazione - CL-TMC-PDC-03-01 - 10/05/2022\\\"}, {\\\"Code\\\": \\\"C001\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Presenza scheda di identificazione\\\"}, {\\\"Code\\\": \\\"C002\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza danneggiamenti visibili\\\"}, {\\\"Code\\\": \\\"C003\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza zone ossidate visibili\\\"}, {\\\"Code\\\": \\\"C004\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza colature su parti preverniciate in zone a vista\\\"}, {\\\"Code\\\": \\\"C005\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza sfogliature in zone a vista\\\"}], \\\"Description\\\": \\\"Piano di controllo base\\\"}, \\\"OilFillingRequired\\\": false, \\\"IsUnknowGammaItemIn\\\": false, \\\"IsUnknowGammaItemOut\\\": false, \\\"IsAlreadyProcessedItem\\\": false, \\\"IsArchivedProductionItem\\\": true},
        {\\\"Product\\\": {\\\"HexColor\\\": \\\"#c4c4c2\\\", \\\"ColorCode\\\": 2, \\\"ColorText\\\": \\\"LIGHT GREY PPG 422644\\\", \\\"ProductNumberIn\\\": \\\"5802987651\\\", \\\"ProductNumberOut\\\": \\\"5802987651V\\\"}, \\\"UserName\\\": \\\"francesco.velluto\\\", \\\"CustomerCode\\\": \\\"0032874\\\", \\\"IsUnknowItem\\\": false, \\\"SerialNumber\\\": \\\"001057087\\\", \\\"CreatedUtcDate\\\": \\\"2024-02-13T11:57:10.6481429Z\\\", \\\"PMSNotAvailable\\\": false, \\\"ProductionItemID\\\": \\\"b09ed268-3215-430d-8a8a-004196bb96aa\\\", \\\"CheckListEntryItem\\\": {\\\"Code\\\": \\\"DEFAULT_LEV0\\\", \\\"Date\\\": \\\"2024-02-13T11:57:08.8478421+00:00\\\", \\\"Guid\\\": \\\"94d7dbe2-faf8-4c9f-bbc3-200bb1ce5cd7\\\", \\\"Notes\\\": \\\"\\\", \\\"OpCode\\\": 1000, \\\"OpResult\\\": true, \\\"UserName\\\": \\\"francesco.velluto\\\", \\\"Checklist\\\": [{\\\"Code\\\": \\\"H001\\\", \\\"Type\\\": \\\"header\\\", \\\"Value\\\": \\\"bk_color: #AA106B; txt_color: #FFFFFF; font_size: 32;\\\", \\\"Description\\\": \\\"Checklist accettazione - CL-TMC-PDC-03-01 - 10/05/2022\\\"}, {\\\"Code\\\": \\\"C001\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Presenza scheda di identificazione\\\"}, {\\\"Code\\\": \\\"C002\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza danneggiamenti visibili\\\"}, {\\\"Code\\\": \\\"C003\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza zone ossidate visibili\\\"}, {\\\"Code\\\": \\\"C004\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza colature su parti preverniciate in zone a vista\\\"}, {\\\"Code\\\": \\\"C005\\\", \\\"Type\\\": \\\"bool\\\", \\\"Value\\\": \\\"true\\\", \\\"Description\\\": \\\"Assenza sfogliature in zone a vista\\\"}], \\\"Description\\\": \\\"Piano di controllo base\\\"}, \\\"OilFillingRequired\\\": false, \\\"IsUnknowGammaItemIn\\\": false, \\\"IsUnknowGammaItemOut\\\": false, \\\"IsAlreadyProcessedItem\\\": false, \\\"IsArchivedProductionItem\\\": true}
    ]}',
    '2'
);\"
"