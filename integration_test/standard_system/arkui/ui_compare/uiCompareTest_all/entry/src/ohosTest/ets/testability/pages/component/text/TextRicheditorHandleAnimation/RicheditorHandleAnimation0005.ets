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
 * 富文本组件放在Swiper容器中，观察手柄和菜单
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ handle-animation_0005
 */
@Entry
@ComponentV2
export struct RicheditorHandleAnimation0005 {
  controller: RichEditorController = new RichEditorController();
  @Local swiperIndex: number = 0;
  @Local status: string = '未选中';

  build() {
    Column() {
      Text('RichEditor在Swiper中的手柄和菜单')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0005')
        .fontSize(11)
        .fontColor('#666')
        .margin({ bottom: 15 })

      Text(`当前页: ${this.swiperIndex + 1}, 状态: ${this.status}`)
        .fontSize(12)
        .margin({ bottom: 10 })

      Swiper() {
        // 第一页
        Column() {
          Text('第一页')
            .fontSize(16)
            .margin({ bottom: 10 })
          RichEditor({ controller: this.controller })
            .width('90%')
            .height(200)
            .border({ width: 1, color: '#ccc' })
            .onSelect((value: RichEditorSelection) => {
              this.status = '文本已选中';
            })
        }

        // 第二页
        Column() {
          Text('第二页')
            .fontSize(16)
        }

        // 第三页
        Column() {
          Text('第三页')
            .fontSize(16)
        }
      }
      .width('100%')
      .height('24.59%')
      .index(this.swiperIndex)
      .onChange((index: number) => {
        this.swiperIndex = index;
        this.status = '切换页面，菜单应隐藏';
      })

      Row() {
        Button('选中文本')
          .fontSize(12)
          .onClick(() => {
            this.controller.setSelection(0, 10);
            this.status = '文本已选中，显示手柄';
          })
          .margin({ right: 10 })

        Button('滑动到第2页')
          .fontSize(12)
          .onClick(() => {
            this.swiperIndex = 1;
          })
      }
      .margin({ top: 20, bottom: 15 })

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
        .padding({ left: 10 })

      Text('1. 选中富文本内容，显示手柄及菜单\n2. 执行Swiper滑动动画\n3. 观察手柄和菜单表现')
        .fontSize(10)
        .width('95%')
        .padding({ left: 10 })
        .margin({ bottom: 10 })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })
        .alignSelf(ItemAlign.Start)
        .padding({ left: 10 })

      Text('手柄跟随组件一起做滑动动画，菜单隐藏')
        .fontSize(10)
        .fontColor('#FF6B35')
        .width('95%')
        .padding({ left: 10 })
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('这是一段可以选中的富文本内容，用于测试在Swiper容器中的手柄和菜单表现。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}
