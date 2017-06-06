INSERT INTO `user` (userId, mobile, pwd, name, status, created, lastmod)
VALUES ('1', 'admin', '$2a$10$5j2OudRWfBMX4mYO/7Va3uY3i9B9NWGeFYHRZXZ/1okWxEEM7IXHK', '系统管理员', 'normal',
        '2017-03-15 16:27:31', '2017-03-15 17:16:53');
INSERT INTO `user` (userId, mobile, pwd, name, status, created, lastmod)
VALUES ('2', '13511111111', '$2a$10$8hw3RmSEwH/FskOjgnyJEukMAtVBVVLm/U1W3FoOtTBUouRjkk2sS', '系统管理员', 'normal',
        '2017-03-15 16:27:31', '2017-03-15 17:16:53');

INSERT INTO `role` (roleId, name, status, created) VALUES (100, '管理员', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (110, '施工员', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (120, '材料员', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (130, '安全员', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (140, '仓管员', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (150, '质量员', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (160, '项目经理', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (170, '深化设计', 'normal', '2017-04-05 17:18:00');
INSERT INTO `role` (roleId, name, status, created) VALUES (180, '预决算', 'normal', '2017-04-05 17:18:00');