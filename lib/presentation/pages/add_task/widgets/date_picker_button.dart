import 'package:how_about_now/presentation/utils/enums/date_utils.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';
import 'package:how_about_now/presentation/widgets/date_picker.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    super.key,
    required this.onDatePicked,
    required this.initialDate,
  });

  final void Function(String) onDatePicked;
  final String initialDate;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final selectedDate = await showCalendarPicker(context);
        if (selectedDate != null) {
          onDatePicked(defaultDateFormat.format(selectedDate));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.calendar_today_rounded,
            size: 20,
          ),
          const Gap(10),
          Text(
            isToday(initialDate) ? context.tr.addTaskPage_today : initialDate,
            style: context.tht.bodyLarge?.copyWith(color: AppColors.primary1000),
          ),
        ],
      ),
    );
  }
}
