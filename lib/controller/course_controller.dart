import 'package:appadsgp1/model/course_model.dart';
import 'package:appadsgp1/model/course_repository.dart';

class CourseController {
  CourseRepository repository = CourseRepository();

  Future<List<CourseEntity>> getCourseList() async {
    List<CourseEntity> list = await repository.getAll();
    //aqui eu poderia filtrar, formatar, regras, etc na LIST
    return list;
  }

  postNewCourse(CourseEntity courseEntity) async {
    try {
      await repository.postNewCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  getLettersFromAvatar(String name) {
    print(name);
    String initials = name.split(' ').map((word) => word[0]).join('');
    return initials.substring(0, 2);
  }

  updateAluno(CourseEntity courseEntity) async {
    try {
      await repository.putUpdateCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  deleteCourse(String id) async {
    try {
      await repository.deleteCourse(id);
    } catch (e) {
      rethrow;
    }
  }
}
