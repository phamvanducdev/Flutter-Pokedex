import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';

class TableMovesWidget extends StatelessWidget {
  final List<Widget> columns;
  final List<List<Widget>> rows;

  const TableMovesWidget({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = AppTheme.of(context).textTheme;

    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 12,
        dataRowHeight: 42,
        headingRowHeight: 42,
        dataTextStyle: textTheme.bodyLarge,
        columns: columns.map((column) => DataColumn(label: column)).toList(),
        rows: rows
            .map(
              (row) => DataRow(
                cells: row.map((cell) => DataCell(cell)).toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}
