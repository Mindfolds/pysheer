#!/usr/bin/env python3
"""Testes básicos do PySheer."""

from __future__ import annotations

import os
import tempfile

from pysheer.core import PySheerAnalyzer
from pysheer.math_models import ADR50Model, adr50


def test_basic_analysis() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        test_file = os.path.join(tmpdir, "test.py")
        with open(test_file, "w", encoding="utf-8") as f:
            f.write("print('test')")

        analyzer = PySheerAnalyzer(tmpdir)
        result = analyzer.analyze(quick=True)

        assert result.files >= 1
        assert result.python_files >= 1


def test_adr50_constant_range_converges() -> None:
    model = ADR50Model()

    highs = [110.0] * 120
    lows = [100.0] * 120
    series = model.compute(highs, lows)

    assert abs(series[-1] - 10.0) < 1e-9


def test_adr50_domain_validation() -> None:
    model = ADR50Model()

    try:
        model.compute([10.0], [11.0])
    except ValueError as exc:
        assert "domínio inválido" in str(exc)
    else:
        raise AssertionError("Era esperado ValueError para high < low")


def test_adr50_helper_function() -> None:
    highs = [15.0, 14.0, 16.0, 16.5]
    lows = [10.0, 9.5, 11.0, 12.0]
    value = adr50(highs, lows)

    assert value > 0.0
