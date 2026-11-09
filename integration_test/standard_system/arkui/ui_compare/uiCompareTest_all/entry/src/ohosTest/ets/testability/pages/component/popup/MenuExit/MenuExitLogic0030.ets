/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
export struct MenuExitLogic0030 {
  @Local testStatus: string = '待测试';

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单项1' }).onClick(() => { this.testStatus = '点击菜单项1'; })
      MenuItem({ content: '菜单项2' }).onClick(() => { this.testStatus = '点击菜单项2'; })
      MenuItem({ content: '菜单项3' }).onClick(() => { this.testStatus = '点击菜单项3'; })
    }
  }

  build() {
    Column({ space: 15 }) {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0030')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)

      Text('测试：多种退出方式')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Button('长按我')
        .id('triggerBtn')
        .width('60%')
        .height(50)
        .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, { enableArrow: true })

      Button('路由跳转测试')
        .id('routerBtn')
        .onClick(() => {
          router.pushUrl({ url: 'testability/pages/Index' });
        })

      Column({ space: 5 }) {
        Text('测试步骤：').fontSize(14).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)
        Text('1. 长按按钮弹出菜单').fontSize(12).alignSelf(ItemAlign.Start)
        Text('2. 点击菜单项 → 菜单应关闭').fontSize(12).alignSelf(ItemAlign.Start)
        Text('3. 长按弹出菜单，点击蒙层空白 → 菜单应关闭').fontSize(12).alignSelf(ItemAlign.Start)
        Text('4. 长按弹出菜单，熄屏 → 菜单应关闭').fontSize(12).alignSelf(ItemAlign.Start)
        Text('5. 长按弹出菜单，退后台 → 菜单应关闭').fontSize(12).alignSelf(ItemAlign.Start)
        Text('6. 长按弹出菜单，横竖屏旋转 → 菜单应关闭').fontSize(12).alignSelf(ItemAlign.Start)
        Text('7. 长按弹出菜单，左右滑手势 → 菜单应关闭').fontSize(12).alignSelf(ItemAlign.Start)
        Text('8. 长按弹出菜单，点击路由跳转 → 菜单应关闭').fontSize(12).alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`).fontSize(14).fontColor(Color.Blue)

      Text('预期结果：所有退出方式均正常工作')
        .fontSize(13)
        .fontColor(Color.Green)
        .padding(8)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

