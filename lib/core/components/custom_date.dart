import 'package:flutter/material.dart';
import 'package:iconventory_web/core/constants/date_time_ext.dart';

class CustomDate extends StatefulWidget {
  final String label;
  final DateTime? initialDate;
  final ValueChanged<DateTime?> onDateChanged;
  final bool readOnly;

  const CustomDate({
    super.key,
    required this.label,
    this.initialDate,
    required this.onDateChanged,
    this.readOnly = false,
  });

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: widget.readOnly ? null : () => _selectDate(context),
            child: InputDecorator(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                  horizontal: 12.0,
                ),
                suffixIcon: !widget.readOnly
                    ? InkWell(
                        onTap: () => _selectDate(context),
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                        ),
                      )
                    : null,
              ),
              child: Text(
                _selectedDate.toFormattedDate(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
