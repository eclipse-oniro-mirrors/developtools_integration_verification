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

import { ConfigurationConstant, } from '@kit.AbilityKit';

@Entry
@Component
struct UIComponentTextRichEditorBuilderSpanDrag0001 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoShowController: RichEditorController = new RichEditorController();
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController };
  // 属性字符串controller
  controllerStyled: RichEditorStyledStringController = new RichEditorStyledStringController();
  // 支持颜色模式切换
  @StorageProp('currentColorMode') @Watch('onColorModeChange') currentMode: number =
    ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
  @State currentBackgroundColor: ResourceStr = $r('sys.color.brand');
  // 支持键盘避让
  @State supportAvoidance: boolean = true;

  // 打开页面时初始资源
  aboutToAppear(): void {
    if (this.currentMode == ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  // 切换颜色模式
  onColorModeChange(): void {
    if (this.currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  // 混合builder
  @Builder
  testBuilder() {
    Row({ space: 2 }) {
      Image($r('sys.media.ohos_app_icon'))
        .width(24)
        .height(24)
        .margin(5)
      Text('测试用Builder')
        .fontSize(10)
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .draggable(true)

  }

  build() {
    Column() {
      // RichEditor 组件
      Row() {
        RichEditor(this.options)
          .id('rich_editor_builderspandrag_0001')
          .width(200)
          .height(80)
          .backgroundColor(Color.White)
          .draggable(true)
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
          .onDragStart((event) => {
            const successMessage = '拖拽起builderSpan，触发回调 '
            console.log(successMessage);
            this.infoShowController.addTextSpan(successMessage, {
              style: {
                fontColor: Color.Gray,
                fontSize: 20
              }
            })
          })

      }

      Row() {
        RichEditor(this.infoShowOptions)
          .width(200)
          .margin(80)
          .height(80)
          .backgroundColor(Color.White)
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
      }

      Row() {
        Button('随机选择', { type: ButtonType.Normal, stateEffect: true })
          .id('button_builderspandrag_0001_select')
          .borderRadius(8)
          .width(120)
          .height(40)
          .margin({ top: 10 })
          .onClick(() => {
            this.controller.setSelection(-1, -1, { menuPolicy: MenuPolicy.SHOW })
          })
      }

      Row() {
        Button('添加Builder', { type: ButtonType.Normal, stateEffect: true })
          .id('button_builderspandrag_0001_addBuilder')
          .borderRadius(8)
          .margin(5)
          .width(120)
          .height(40)
          .onClick(() => {
            // 1. 获取当前光标位置作为插入点（如果没有光标，默认插入到末尾）
            const insertOffset = this.controller.getCaretOffset();
            // 2. 调用控制器的addBuilderSpan方法插入自定义Builder
            this.controller.addBuilderSpan(
              () => this.testBuilder(), // 传入自定义Builder（需包装为无参函数）
              { offset: insertOffset } // 配置插入位置
            );
            console.info('builderSpan已插入到富文本编辑器中');
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}