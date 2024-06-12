enum OrderStatus {
  pending,
  completed,
  cancelled,
  delivered,
  processing,
}

// extension OrderStatusExtension on OrderStatus {
//   String get value {
//     switch (this) {
//       case OrderStatus.pending:
//         return 'pending';
//       case OrderStatus.completed:
//         return 'completed';
//       case OrderStatus.cancelled:
//         return 'cancelled';
//     }
//   }

//   static OrderStatus fromString(String status) {
//     switch (status) {
//       case 'pending':
//         return OrderStatus.pending;
//       case 'completed':
//         return OrderStatus.completed;
//       case 'cancelled':
//         return OrderStatus.cancelled;
//       default:
//         throw Exception('Unknown order status: $status');
//     }
//   }
//}
