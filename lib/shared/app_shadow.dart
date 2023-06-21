import 'package:flutter/material.dart';

class AppShadow {
  AppShadow._();

  static BoxDecoration defaultLv1 = BoxDecoration(
    color: const Color(0xFFFFFFFF),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 2,
        color: const Color(0xFF333333).withOpacity(0.12),
      ),
      BoxShadow(
        offset: const Offset(0, 2),
        blurRadius: 8,
        color: const Color(0xFF333333).withOpacity(0.12),
      ),
    ],
  );

  static BoxDecoration defaultLv2 = BoxDecoration(
    color: const Color(0xFFFFFFFF),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 8,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 2),
        blurRadius: 4,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 8,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 14),
        blurRadius: 16,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 2,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
    ],
  );

  static BoxDecoration defaultLv3 = BoxDecoration(
    color: const Color(0xFFFFFFFF),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 6),
        blurRadius: 10,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 20),
        blurRadius: 12,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 16),
        blurRadius: 14,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 6),
        blurRadius: 4,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 4,
        color: const Color(0xFF333333).withOpacity(0.05),
      ),
    ],
  );

  static BoxDecoration primaryButtonLv1 = BoxDecoration(
    color: const Color(0xFFF8524B),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 8,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 2),
        blurRadius: 4,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 8,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 14),
        blurRadius: 16,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 2,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
    ],
  );

  static BoxDecoration primaryButtonLv2 = BoxDecoration(
    color: const Color(0xFFF8524B),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 6),
        blurRadius: 10,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 20),
        blurRadius: 30,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 16),
        blurRadius: 14,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 6),
        blurRadius: 10,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 4,
        color: const Color(0xFFD83731).withOpacity(0.1),
      ),
    ],
  );

  static BoxDecoration secondaryButtonLv1 = BoxDecoration(
    color: const Color(0xFF22267E),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 8,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 2),
        blurRadius: 4,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 8,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 14),
        blurRadius: 16,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 2,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
    ],
  );

  static BoxDecoration secondaryButtonLv2 = BoxDecoration(
    color: const Color(0xFF22267E),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 6),
        blurRadius: 10,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 20),
        blurRadius: 30,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 16),
        blurRadius: 14,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 6),
        blurRadius: 10,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
      BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: 4,
        color: const Color(0xFF0D0053).withOpacity(0.1),
      ),
    ],
  );
}
