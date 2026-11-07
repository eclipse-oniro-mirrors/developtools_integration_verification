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

interface ParamInfo0290 {
  info: string;
}

// PageHome1 组件
@Component
export struct PageHome10290 {
  @Prop index: number = 0;

  build() {
    NavDestination() {
      Column() {
        Text(`PageHome1 页面`)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text(`第 ${this.index} 次推入`)
          .fontSize(20)
          .margin({ top: 10 })
          .fontColor('#2196F3')
        
        Text(`这是第 ${this.index} 个 PageHome1 页面`)
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面显示正常')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E3F2FD')
    }
    .title(`PageHome1-${this.index}`)
    .hideTitleBar(false)
  }
}

@Entry
@Component
export struct MultiNavigation0290 {
  @State resultText: string = '结果显示区域';
  @State pushCount: number = 0;
  private navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string, param: ESObject) {
    if (name === 'PageHome1') {
      PageHome10290({ index: param as number })
    }
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('MultiNavigation测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column({ space: 8 }) {

          // 结果显示区域
          Column() {
            Text('结果显示')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })
              .alignSelf(ItemAlign.Start)

            Text(this.resultText)
              .id('resultText')
              .fontSize(12)
              .fontColor('#333333')
              .width('100%')
              .padding(8)
              .backgroundColor('#F5F5F5')
              .borderRadius(6)
              .height(60)
          }
          .width('95%')
          .padding(10)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)

          // 操作按钮区域
          Column({ space: 6 }) {
            Button('pushPath PageHome1')
              .id('pushPathButton')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.pushCount++;
                  this.navPathStack.pushPathByName('PageHome1', this.pushCount);
                  this.resultText = `已推入第 ${this.pushCount} 个 PageHome1 - 页面显示正常`;
                  console.info('[MultiNavigation0290] pushPath PageHome1, count:', this.pushCount);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0290] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('getAllPathName')
              .id('getAllPathNameButton')
              .fontSize(13)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const allPathNames = this.navPathStack.getAllPathName();
                  this.resultText = `当前栈内容：${allPathNames.join('，')} (共${allPathNames.length}个)`;
                  console.info('[MultiNavigation0290] getAllPathName:', allPathNames);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0290] Error:', error);
                }
              })

            Button('size')
              .id('sizeButton')
              .fontSize(13)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const stackSize = this.navPathStack.size();
                  this.resultText = `栈大小：${stackSize}`;
                  console.info('[MultiNavigation0290] size:', stackSize);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0290] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('重置测试')
              .fontSize(13)
              .backgroundColor('#F44336')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.navPathStack.clear();
                  this.pushCount = 0;
                  this.resultText = '结果显示区域';
                  console.info('[MultiNavigation0290] 测试已重置');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0290] Error:', error);
                }
              })
          }
          .width('95%')
          .padding(10)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.None)

      // Navigation 组件区域
      Navigation(this.navPathStack) {
        Column() {
          Text('MultiNavigation 主页面')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })
          
          Text('请快速点击上方按钮进行测试')
            .fontSize(14)
            .margin({ top: 10 })
            .fontColor('#666666')
          
          Text('测试快速push的稳定性')
            .fontSize(12)
            .margin({ top: 5 })
            .fontColor('#999999')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#FFF9C4')
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .height('24.59%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
