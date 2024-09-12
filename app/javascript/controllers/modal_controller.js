import { Controller } from "stimulus";

export default class extends Controller {
  close() {
    this.element.remove(); // ปิด modal โดยการลบ element ออกจาก DOM
  }

  success() {
    this.close(); // ใช้เมื่อลบข้อมูลสำเร็จ
  }
}
