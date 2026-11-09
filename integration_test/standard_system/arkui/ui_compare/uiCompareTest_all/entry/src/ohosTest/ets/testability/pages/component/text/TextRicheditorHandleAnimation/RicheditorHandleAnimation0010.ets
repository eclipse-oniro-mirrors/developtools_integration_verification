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

/**
 * 选中图文混合内容后执行动画
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0010
 */
@Entry
@ComponentV2
export struct RicheditorHandleAnimation0010 {
  controller: RichEditorController = new RichEditorController();
  @Local scaleValue: number = 1;
  @Local translateX: number = 0;
  @Local rotateValue: number = 0;
  @Local status: string = '未选中';


  startAnimation(): void {
    animateTo({ duration: 500 }, () => {
      this.scaleValue = 1.3;
      this.translateX = 15;
      this.rotateValue = 10;
    });
    this.status = '动画执行中';
    setTimeout(() => {
      this.status = '动画完成，菜单应隐藏';
    }, 600);
  }

  resetAnimation(): void {
    animateTo({ duration: 300 }, () => {
      this.scaleValue = 1;
      this.translateX = 0;
      this.rotateValue = 0;
    });
    this.status = '已重置';
  }

  build() {
    Scroll() {
      Column() {
        Text('图文混合内容动画测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0010')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text(`状态: ${this.status}`)
          .fontSize(12)
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('90%')
          .height(250)
          .border({ width: 1, color: '#ccc' })
          .scale({ x: this.scaleValue, y: this.scaleValue })
          .translate({ x: this.translateX })
          .rotate({ angle: this.rotateValue })
          .margin({ bottom: 15 })
          .onSelect((value: RichEditorSelection) => {
            this.status = '已选中builder内容';
          })

        Row() {
          Button('选中内容')
            .fontSize(12)
            .onClick(() => {
              this.controller.setSelection(0, 20);
              this.status = '已选中';
            })
            .margin({ right: 5 })

          Button('执行动画')
            .fontSize(12)
            .onClick(() => this.startAnimation())
            .margin({ right: 5 })

          Button('重置')
            .fontSize(12)
            .onClick(() => this.resetAnimation())
        }
        .width('90%')
        .margin({ bottom: 15 })

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {})
          .margin({ bottom: 15 })

        Text('测试说明：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('1. 选中图文混合内容\n2. 执行缩放、平移、旋转动画\n3. 观察手柄和菜单')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('手柄跟随组件一起做动画，菜单隐藏')
          .fontSize(10)
          .fontColor('#FF6B35')
          .width('95%')
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('前面的文本内容 ', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
    this.controller.addImageSpan($r('app.media.icon'), {
      imageStyle: {
        size: [40, 40]
      }
    });
    this.controller.addTextSpan(' 后面的文本内容，包含图片和文本的混合内容用于测试动画效果。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}
