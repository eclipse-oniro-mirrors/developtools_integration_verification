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
struct UIComponentOtherRefreshAbility001 {
  @State isRefreshing: boolean = false
  @State message: string = 'Hello'
  @State refreshState: string = ''
  @State refreshStateResult: string = '未上报状态'
  @State arr: String[] = ['0', '1', '2', '3', '4','5','6','7','8','9','10']
  private scrollController: Scroller = new Scroller()

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .height('10%')
        .margin({ top: 20 })
        .key('UIComponentOtherRefreshAbility001_001')
      Text('状态：' + this.refreshStateResult)
        .fontSize(15)
        .fontColor(Color.Blue)
        .height('5%')
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
      .refreshOffset(64)
      .pullToRefresh(false)
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('Refresh onStatueChange state is ' + refreshStatus);
        this.refreshState = refreshStatus.toString();
        if(this.refreshState == RefreshStatus.Drag.toString()) {
          this.refreshStateResult = '下拉距离小于刷新距离';
        } else if(this.refreshState == RefreshStatus.OverDrag.toString()) {
          this.refreshStateResult = '下拉距离超过刷新距离';
        } else if(this.refreshState == RefreshStatus.Refresh.toString()) {
          this.refreshStateResult = '会进入刷新状态'
        } else {
          this.refreshStateResult = '';
        }
      })
      .backgroundColor(0x89CFF0)
      .height('70%')

      Row() {
        Button('refresh')
          .id('refresh')
          .stateEffect(true)
          .onClick(() => {
            this.scrollController.scrollBy(0, 1000)
          })
        Text(`RefreshState is ${this.refreshState}`)
          .fontSize(20)
      }
      .height('5%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}