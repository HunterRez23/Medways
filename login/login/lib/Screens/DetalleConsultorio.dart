import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DetalleConsultorio extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String description;

  const DetalleConsultorio({
    required this.imagePath,
    required this.productName,
    required this.description,
  });

  @override
  _DetalleConsultorioState createState() => _DetalleConsultorioState();
}

class _DetalleConsultorioState extends State<DetalleConsultorio> {
  final Map<DateTime, Color> _highlightedDays = {
    DateTime.utc(2024, 8, 19): Colors.red,
    DateTime.utc(2024, 8, 22): Colors.red,
    DateTime.utc(2024, 8, 30): Colors.red,
  };

  final List<String> _horasDisponibles = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
  ];

  String? _horaSeleccionada;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  DateTime? _previouslySelectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(184, 2, 50, 129),
        title: Text("Información del médico", style: TextStyle(color: Colors.white)),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.imagePath),
                    backgroundColor: Color.fromARGB(184, 2, 50, 129),
                    radius: 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.productName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Text(
                    'Especialidad: ${widget.description}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Contacto'),
                  subtitle: Text('123-456-7890'),
                ),
                const ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Correo electrónico'),
                  subtitle: Text('doctor@example.com'),
                ),
                const ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Cédula profesional'),
                  subtitle: Text('1234567890'),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'El Dr. Nombre Apellido es un pediatra altamente cualificado con años de experiencia en el cuidado de niños y adolescentes. Graduado de la Universidad XYZ...',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('Horario de consulta'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Lunes a Viernes: 9:00 AM - 5:00 PM'),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Agendar Cita',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          const Text(
                                            'Agende su cita con su médico.',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          const Text(
                                            'Verifique la disponibilidad de la fecha u hora antes de agendar.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Motivo de consulta',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TableCalendar(
                                            firstDay: DateTime.utc(2020, 1, 1),
                                            lastDay: DateTime.utc(2030, 12, 31),
                                            focusedDay: _focusedDay,
                                            selectedDayPredicate: (day) {
                                              return isSameDay(_selectedDay, day);
                                            },
                                            onDaySelected: (selectedDay, focusedDay) {
                                              setState(() {
                                                if (_previouslySelectedDay != null && _previouslySelectedDay != selectedDay) {
                                                  _highlightedDays[_previouslySelectedDay!] = Colors.transparent;
                                                }

                                                _selectedDay = selectedDay;
                                                _focusedDay = focusedDay;
                                                _highlightedDays[_selectedDay!] = Colors.yellow;
                                                _previouslySelectedDay = selectedDay;
                                              });
                                            },
                                            calendarBuilders: CalendarBuilders(
                                              defaultBuilder: (context, day, focusedDay) {
                                                Color textColor = Colors.black;
                                                if (isSameDay(day, _selectedDay)) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.yellow,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    margin: const EdgeInsets.all(4.0),
                                                    child: Center(
                                                      child: Text(
                                                        day.day.toString(),
                                                        style: TextStyle(color: textColor),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                if (_highlightedDays.containsKey(day)) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: _highlightedDays[day],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    margin: const EdgeInsets.all(4.0),
                                                    child: Center(
                                                      child: Text(
                                                        day.day.toString(),
                                                        style: TextStyle(color: Colors.black),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                            value: _horaSeleccionada,
                                            hint: const Text('Seleccione la hora'),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _horaSeleccionada = newValue!;
                                              });
                                            },
                                            items: _horasDisponibles
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                          const SizedBox(height: 20),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Comprobar si el día está en verde (es decir, ya tiene una cita agendada)
                                                if (_selectedDay != null && _highlightedDays[_selectedDay] == Colors.green) {
                                                  // Mostrar mensaje de error
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text('Cita no disponible'),
                                                        content: const Text('Ya existe una cita agendada para este día. Por favor seleccione otro día.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: const Text('Aceptar'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                } else if (_selectedDay != null && _horaSeleccionada != null) {
                                                  // Si no hay cita agendada, proceder con la cita
                                                  setState(() {
                                                    _highlightedDays[_selectedDay!] = Colors.green;
                                                    _selectedDay = null;
                                                    _horaSeleccionada = null;
                                                    _previouslySelectedDay = null;
                                                  });

                                                  // Mostrar mensaje de éxito
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text('Cita Agendada'),
                                                        content: const Text('La cita se agendó exitosamente.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: const Text('Aceptar'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  Navigator.pop(context); // Cierra el modal
                                                } else {
                                                  // Si no hay selección de fecha y hora
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text('Error'),
                                                        content: const Text('Por favor seleccione un día y una hora antes de agendar.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: const Text('Aceptar'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              child: const Text('Agendar'),
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Agendar cita',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Ubicación'),
                  subtitle: Text('123 Calle Principal, Ciudad, País'),
                ),
                const ListTile(
                  leading: Icon(Icons.link),
                  title: Text('Redes sociales'),
                  subtitle: Text('LinkedIn: linkedin.com/in/drnombreactivo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
