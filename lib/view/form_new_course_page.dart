import 'package:appadsgp1/controller/course_controller.dart';
import 'package:appadsgp1/model/course_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormNewCoursePage extends StatefulWidget {
  CourseEntity? courseEdit;
  FormNewCoursePage({super.key, this.courseEdit});

  @override
  State<FormNewCoursePage> createState() => _FormNewCoursePageState();
}

class _FormNewCoursePageState extends State<FormNewCoursePage> {
  final formKey = GlobalKey<FormState>();

  String id = '';

  TextEditingController textNameController = TextEditingController();
  TextEditingController textDescriptionController = TextEditingController();
  TextEditingController textStartAtController = TextEditingController();

  CourseController controller = CourseController();

  postNewCourse() async {
    try {
      await controller.postNewCourse(CourseEntity(
          name: textNameController.text,
          description: textDescriptionController.text,
          startAt: textStartAtController.text));
      //
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Curso inserido com sucesso."),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
        ),
      );
    }
  }

  putUpdateCourse() async {
    try {
      await controller.postNewCourse(
        CourseEntity(
          id: id,
          name: textNameController.text,
          description: textDescriptionController.text,
          startAt: textStartAtController.text,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados salvos!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.courseEdit != null) {
      textNameController.text = widget.courseEdit?.name ?? '';
      textDescriptionController.text = widget.courseEdit?.description ?? '';
      textStartAtController.text = widget.courseEdit?.startAt ?? '';
      id = widget.courseEdit?.id ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de curso", overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Digite o nome do curso'),
                controller: textNameController,
                validator: (value) {
                  if (value == null) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Digite a descrição do curso'),
                controller: textDescriptionController,
                validator: (value) {
                  if (value == null) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Digite a data de inicio do curso'),
                controller: textStartAtController,
                validator: (value) {
                  if (value == null) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 48,
                width: MediaQuery.sizeOf(context).width, //100%
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (widget.courseEdit != null) {
                        putUpdateCourse();
                      } else {
                        postNewCourse();
                      }
                    }
                  },
                  child: const Text("Salvar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
