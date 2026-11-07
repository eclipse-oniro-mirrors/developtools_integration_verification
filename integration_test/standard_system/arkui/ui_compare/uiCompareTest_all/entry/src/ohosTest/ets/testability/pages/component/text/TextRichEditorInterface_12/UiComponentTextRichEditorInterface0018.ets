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
@Component
struct UiComponentTextRichEditorInterface0018 {
  // 第一个RichEditor - 验证默认选择菜单
  controller1: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  
  // 第二个RichEditor - 验证自定义选择菜单
  controller2: RichEditorController = new RichEditorController();
  options2: RichEditorOptions = { controller: this.controller2 };
  
  // 用于显示操作结果的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('closeSelectionMenu功能测试：验证默认和自定义选择菜单的关闭')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
        .fontWeight(FontWeight.Bold)
      
      Text('操作结果显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示操作结果的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0018')
        .width('100%')
        .height(80)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)

      // 第一个测试区域 - 默认选择菜单
      Text('1. 默认选择菜单测试区域')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      RichEditor(this.options1)
        .id('richEditor0018_1')
        .width('100%')
        .height(80)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .placeholder('长按此处文本产生默认选择菜单')
        .margin(10)
        .onSelect((value: RichEditorSelection) => {
          console.log('默认菜单onSelect:', JSON.stringify(value))
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('默认菜单：文本已选中，产生默认选择菜单\n选择信息: ' + JSON.stringify(value), {
            style: {
              fontSize: 12,
              fontColor: Color.Blue
            }
          })
        })
      
      Button('关闭默认选择菜单')
        .id('closeDefaultMenuBtn0018')
        .width('80%')
        .height(35)
        .margin(5)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          // 关闭默认选择菜单
          this.controller1.closeSelectionMenu()
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('✅ 已调用closeSelectionMenu()关闭默认菜单\n✅ 默认选择菜单关闭功能测试完成', {
            style: {
              fontSize: 12,
              fontColor: Color.Blue,
              fontWeight: FontWeight.Bold
            }
          })
        })

      // 第二个测试区域 - 自定义选择菜单
      Text('2. 自定义选择菜单测试区域')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 5 })
      
      RichEditor(this.options2)
        .id('richEditor0018_2')
        .width('100%')
        .height(80)
        .border({ width: 2, color: Color.Red })
        .borderRadius(8)
        .padding(8)
        .placeholder('长按此处文本产生自定义选择菜单')
        .margin(10)
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.customMenu, ResponseType.LongPress)
        .onSelect((value: RichEditorSelection) => {
          console.log('自定义菜单onSelect:', JSON.stringify(value))
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('自定义菜单：文本已选中，产生自定义选择菜单\n选择信息: ' + JSON.stringify(value), {
            style: {
              fontSize: 12,
              fontColor: Color.Red
            }
          })
        })
      
      Button('添加测试内容到两个编辑器')
        .id('addContentBtn0018')
        .width('80%')
        .height(40)
        .margin(10)
        .backgroundColor(Color.Green)
        .onClick(() => {
          // 为两个RichEditor添加测试内容
          this.controller1.deleteSpans()
          this.controller1.addTextSpan('默认菜单测试文本内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          
          this.controller2.deleteSpans()
          this.controller2.addTextSpan('自定义菜单测试文本内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('测试内容已添加到两个编辑器\n请分别长按测试选择菜单功能', {
            style: {
              fontSize: 12,
              fontColor: Color.Green
            }
          })
        })
      
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }

  @Builder
  customMenu() {
    Column() {
      Menu() {
        MenuItem({ 
          content: '📋 复制',
          labelInfo: '自定义复制'
        })
          .onClick(() => {
            // 在MenuItem的点击事件内设置this.controller2.closeSelectionMenu()
            this.controller2.closeSelectionMenu()
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan("✅ 自定义菜单'复制'被点击\n✅ 已调用closeSelectionMenu()关闭自定义菜单\n✅ 自定义选择菜单关闭功能测试完成", {
              style: {
                fontSize: 12,
                fontColor: Color.Red,
                fontWeight: FontWeight.Bold
              }
            })
          })
        MenuItem({ 
          content: '📄 粘贴',
          labelInfo: '自定义粘贴'
        })
          .onClick(() => {
            this.displayController.deleteSpans()
            this.displayController.addTextSpan("自定义菜单'粘贴'被点击\n（此项不关闭菜单，用于对比测试）", {
              style: {
                fontSize: 12,
                fontColor: Color.Orange
              }
            })
          })
        MenuItem({ 
          content: '🔘 全选',
          labelInfo: '自定义全选'
        })
          .onClick(() => {
            this.displayController.deleteSpans()
            this.displayController.addTextSpan("自定义菜单'全选'被点击\n（此项不关闭菜单，用于对比测试）", {
              style: {
                fontSize: 12,
                fontColor: Color.Orange
              }
            })
          })
      }
      .backgroundColor('#FFE4E1')
      .borderRadius(12)
      .border({ width: 2, color: Color.Red })
      .shadow({ radius: 8, color: '#FF6B6B', offsetX: 2, offsetY: 2 })
    }
    .padding(5)
  }
}
