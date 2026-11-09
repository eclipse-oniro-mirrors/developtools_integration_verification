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

@Entry
@ComponentV2
export struct MenuExitLogic0080 {
  @Local testStatus: string = '待测试';
  @Local showButton: boolean = true;

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
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0080')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)

      Text('测试：目标节点销毁')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      if (this.showButton) {
        Button('右键点击我')
          .id('triggerBtn')
          .width('60%')
          .height(50)
          .bindContextMenu(this.MenuBuilder, ResponseType.RightClick, { enableArrow: false })
      }

      Button('销毁目标节点')
        .id('destroyBtn')
        .backgroundColor('#FF6B6B')
        .onClick(() => {
          this.showButton = false;
          this.testStatus = '目标节点已销毁';
        })

      Button('恢复目标节点')
        .id('restoreBtn')
        .backgroundColor('#4CAF50')
        .onClick(() => {
          this.showButton = true;
          this.testStatus = '目标节点已恢复';
        })

      Column({ space: 5 }) {
        Text('测试步骤：').fontSize(14).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)
        Text('1. 右键点击按钮弹出菜单').fontSize(12).alignSelf(ItemAlign.Start)
        Text('2. 菜单显示时，点击"销毁目标节点"').fontSize(12).alignSelf(ItemAlign.Start)
        Text('3. 观察菜单是否自动关闭').fontSize(12).alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`).fontSize(14).fontColor(Color.Blue)

      Text('预期结果：目标节点销毁时菜单自动关闭')
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

