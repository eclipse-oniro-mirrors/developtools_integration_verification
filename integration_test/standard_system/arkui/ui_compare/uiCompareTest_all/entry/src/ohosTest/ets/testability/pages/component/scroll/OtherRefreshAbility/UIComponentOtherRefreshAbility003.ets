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
struct UIComponentOtherRefreshAbility003 {
  @State isRefreshing: boolean = true
  @State message: string = 'Hello'
  @State refreshState: string = ''
  @State arr: String[] = ['0', '1', '2', '3', '4','5','6','7','8','9','10']
  private scrollController: Scroller = new Scroller()

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .height('10%')
        .margin({ top: 20 })
        .key('UIComponentOtherRefreshAbility003_001')
      Refresh({ refreshing: $$this.isRefreshing }) {
        Scroll(this.scrollController) {
          List() {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('70%')
                  .height(80)
                  .fontSize(16)
                  .margin(10)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .onScrollIndex((first: number) => {
            console.info(first.toString())
          })
          .width('100%')
          .height('100%')
          .alignListItem(ListItemAlign.Center)
        }
        .scrollBar(BarState.Off)
      }
      .refreshOffset(100)
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('Refresh onStatueChange state is ' + refreshStatus);
        this.refreshState = refreshStatus.toString();
      })
      .backgroundColor(0x89CFF0)
      .height('75%')


      Button('refresh')
        .id('refresh')
        .stateEffect(true)
        .onClick(() => {
          this.scrollController.scrollBy(0, 100)
        })
        .height('5%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}