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
export struct MenuExitLogic0090 {
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 15 }) {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0090')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)

      Text('测试：bindMenu退出逻辑')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Button('点击我')
        .id('triggerBtn')
        .width('60%')
        .height(50)
        .bindMenu([
          { value: '菜单项1', action: () => { this.testStatus = '点击菜单项1'; } },
          { value: '菜单项2', action: () => { this.testStatus = '点击菜单项2'; } },
          { value: '菜单项3', action: () => { this.testStatus = '点击菜单项3'; } }
        ], {
          title: 'HelloWorld',
          showInSubWindow: false,
          enableArrow: false
        })

      Button('路由跳转')
        .id('routerBtn')
        .onClick(() => {
          router.pushUrl({ url: 'testability/pages/Index' });
        })

      Column({ space: 5 }) {
        Text('测试步骤：').fontSize(14).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)
        Text('1. 点击按钮弹出菜单，点击菜单项').fontSize(12).alignSelf(ItemAlign.Start)
        Text('2. 点击按钮弹出菜单，点击蒙层空白').fontSize(12).alignSelf(ItemAlign.Start)
        Text('3. 点击按钮弹出菜单，熄屏').fontSize(12).alignSelf(ItemAlign.Start)
        Text('4. 点击按钮弹出菜单，退后台').fontSize(12).alignSelf(ItemAlign.Start)
        Text('5. 点击按钮弹出菜单，横竖屏旋转').fontSize(12).alignSelf(ItemAlign.Start)
        Text('6. 点击按钮弹出菜单，BackPressed手势').fontSize(12).alignSelf(ItemAlign.Start)
        Text('7. 点击按钮弹出菜单，路由跳转').fontSize(12).alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`).fontSize(14).fontColor(Color.Blue)

      Text('预期结果：所有退出方式正常工作')
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

