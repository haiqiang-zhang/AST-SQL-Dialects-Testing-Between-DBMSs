SELECT x, isFinite(x), isInfinite(x), isNaN(x) FROM (SELECT arrayJoin([0, 1, -1, inf, -inf, nan, -nan, 0 / 0, 1 / 0, -1 / 0, 0 / -0., -0. / 0, 1 / -0., -1 / -0.]) AS x);
SELECT x, isFinite(x), isInfinite(x), isNaN(x) FROM (SELECT toFloat32(arrayJoin([0, 1, -1, inf, -inf, nan, -nan, 0 / 0, 1 / 0, -1 / 0, 0 / -0., -0. / 0, 1 / -0., -1 / -0.])) AS x);
