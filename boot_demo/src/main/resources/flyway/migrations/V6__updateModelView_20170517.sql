ALTER TABLE decobim.modelview
  ADD projectId  BIGINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE decobim.modelview
  ADD modelId  BIGINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE decobim.modelview
  change  avatarUrl thumbnailUrl VARCHAR(200) NOT NULL DEFAULT '';