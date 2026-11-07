/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UIComponentPopupBoxMenuFollow13 {
  @State selectedOption: string = '未选择';
  @State menuTriggerCount: number = 0;
  @State imageScale: number = 1;
  @State imageRotation: number = 0;
  @State menuVisible: boolean = false;

  private handleMenuClick(option: string): void {
    this.selectedOption = option;
    console.info(`菜单选项 ${option} 被点击`);
    this.animateImage();
  }

  private animateImage(): void {
    this.imageScale = 1.1;
    this.imageRotation += 5;
    setTimeout(() => {
      this.imageScale = 1;
    }, 200);
  }

  private resetState(): void {
    this.selectedOption = '未选择';
    this.menuTriggerCount = 0;
    this.imageScale = 1;
    this.imageRotation = 0;
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单选项1' })
        .onClick(() => {
          this.handleMenuClick('选项1');
        })
        .height(35)
      MenuItem({ content: '菜单选项2' })
        .onClick(() => {
          this.handleMenuClick('选项2');
        })
        .height(35)
      MenuItem({ content: '菜单选项3' })
        .onClick(() => {
          this.handleMenuClick('选项3');
        })
        .height(35)
      MenuItem({ content: '菜单选项4' })
        .onClick(() => {
          this.handleMenuClick('选项4');
        })
        .height(35)
      MenuItem({ content: '重置状态' })
        .onClick(() => {
          this.resetState();
        })
        .height(35)
    }
    .width(100)
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('bindContextMenu Preview 测试')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .margin({ top: 30 })
          .textAlign(TextAlign.Center)
          .width('100%')

        Text('验证 bindContextMenu 设置 preview 为 MenuPreviewMode.IMAGE，placement 设置为 Bottom 的时候，菜单正常显示，菜单项跟随预览图出现')
          .fontSize(14)
          .lineHeight(22)
          .backgroundColor('#E3F2FD')
          .padding(15)
          .borderRadius(8)
          .width('90%')
          .fontColor('#1976D2')
          .textAlign(TextAlign.Center)

        Row({ space: 15 }) {
          Text(`已选择: ${this.selectedOption}`)
            .fontSize(14)
            .fontColor('#333333')
            .padding(8)
            .backgroundColor('#F0F0F0')
            .borderRadius(6)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)

          Text(`触发次数: ${this.menuTriggerCount}`)
            .fontSize(14)
            .fontColor('#333333')
            .padding(8)
            .backgroundColor('#F0F0F0')
            .borderRadius(6)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
        }
        .width('90%')
        .margin({ top: 10 })

        Button('重置所有')
          .fontSize(14)
          .height(40)
          .width('90%')
          .backgroundColor('#FF6B6B')
          .onClick(() => {
            this.resetState();
          })
          .margin({ top: 5 })

        Divider()
          .width('90%')
          .color('#E0E0E0')
          .margin({ top: 10, bottom: 10 })

        Text('长按下方图片测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .margin({ top: 10 })

        Image('/icon.png')
          .id('UIComponentPopupBoxMenuFollow13')
          .width(150)
          .height(100)
          .borderRadius(12)
          .border({ width: 3, color: '#007DFF', style: BorderStyle.Solid })
          .shadow({
            radius: 10,
            color: '#007DFF',
            offsetX: 0,
            offsetY: 0
          })
          .scale({ x: this.imageScale, y: this.imageScale })
          .rotate({ angle: this.imageRotation })
          .animation({
            duration: 300,
            curve: Curve.EaseInOut,
            iterations: 1
          })
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            preview: MenuPreviewMode.IMAGE,
            placement: Placement.Bottom,
            enableArrow: false,
            onAppear: () => {
              this.menuVisible = true;
              this.menuTriggerCount++;
              console.info('菜单显示');
            },
            onDisappear: () => {
              this.menuVisible = false;
              console.info('菜单消失');
            }
          })
          .onClick(() => {
            this.animateImage();
          })

        Text(`配置: preview=IMAGE, placement=Bottom${this.menuVisible ? ' (菜单已显示)' : ''}`)
          .fontSize(13)
          .lineHeight(20)
          .backgroundColor('#F0F8FF')
          .padding(12)
          .borderRadius(8)
          .width('90%')
          .fontColor('#4169E1')
          .textAlign(TextAlign.Center)
          .margin({ top: 15 })

      }
      .width('100%')
      .padding({ left: 20, right: 20, bottom: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
    .scrollBar(BarState.Auto)
    .edgeEffect(EdgeEffect.Spring)
  }
}

