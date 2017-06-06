ALTER TABLE decobim.barcodeitem
  ADD modelId BIGINT DEFAULT 0 NOT NULL;
ALTER TABLE decobim.barcodeitem
  MODIFY COLUMN modelId BIGINT NOT NULL DEFAULT 0
  AFTER projectId;