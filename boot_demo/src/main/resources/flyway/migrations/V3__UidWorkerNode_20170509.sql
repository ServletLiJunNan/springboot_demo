CREATE TABLE workernode(
    workerNodeId BIGINT NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
    hostName VARCHAR(64) NOT NULL COMMENT 'host name',
    port VARCHAR(64) NOT NULL COMMENT 'port',
    type INT NOT NULL COMMENT 'node type: ACTUAL or CONTAINER',
    launchDate DATE NOT NULL COMMENT 'launch date',
    modified TIMESTAMP NOT NULL COMMENT 'modified time',
    created DATE NOT NULL COMMENT 'created time',
    PRIMARY KEY(workerNodeId)
) COMMENT='DB WorkerID Assigner for UID Generator',ENGINE = INNODB;
