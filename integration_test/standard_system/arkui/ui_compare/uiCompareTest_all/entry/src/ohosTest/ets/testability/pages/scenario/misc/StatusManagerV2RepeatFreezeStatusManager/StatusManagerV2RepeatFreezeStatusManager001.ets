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
@ComponentV2
struct StatusManagerV2RepeatFreezeStatusManager001 {
  @Local simpleList: string[] = [];
  private GridScroller: Scroller = new Scroller();

  aboutToAppear(): void {
    for (let i = 0; i < 30; i++) {
      this.simpleList.push(`${i}`);
    }
  }

  build() {
    Column() {
      Column() {
        Row() {
          Column() {
            List() {
              Repeat(this.simpleList)
                .each((obj: RepeatItem<string>) => {
                })
                .key((item: string, index: number) => item)
                .virtualScroll({ totalCount: this.simpleList.length })
                .templateId(() => `a`)
                .template('a', (ri) => {
                  ChildCompont({
                    message: ri.item
                  })
                }, { cachedCount: 2 })
            }
          }.width('25%').height('75%').justifyContent(FlexAlign.Center)

          Column() {
            Grid(this.GridScroller) {
              Repeat(this.simpleList)
                .each((obj: RepeatItem<string>) => {
                })
                .key((item: string, index: number) => item)
                .virtualScroll({ totalCount: this.simpleList.length })
                .templateId(() => `a`)
                .template('a', (ri) => {
                  GridItem() {
                    ChildCompont({
                      message: ri.item
                    })
                  }
                }, { cachedCount: 2 })
            }
            .columnsTemplate('1fr')
          }.width('25%').height('70%').justifyContent(FlexAlign.Center)

          Column() {
            WaterFlow() {
              Repeat(this.simpleList)
                .each((obj: RepeatItem<string>) => {
                })
                .key((item: string, index: number) => item)
                .virtualScroll({ totalCount: this.simpleList.length })
                .templateId(() => `a`)
                .template('a', (ri) => {
                  ChildCompont({
                    message: ri.item
                  })
                }, { cachedCount: 2 })
            }
          }.width('25%').height('75%').justifyContent(FlexAlign.Center)

          Column() {
            Swiper() {
              Repeat(this.simpleList)
                .each((obj: RepeatItem<string>) => {
                })
                .key((item: string, index: number) => item)
                .virtualScroll({ totalCount: this.simpleList.length })
                .templateId(() => `a`)
                .template('a', (ri) => {
                  ChildCompont({
                    message: ri.item
                  })
                }, { cachedCount: 2 })
            }
          }.width('25%').height('75%').justifyContent(FlexAlign.Center)
        }
      }
      Column() {
        Button('删除元素')
          .id('delete')
          .stateEffect(true)
          .margin({ top: 10})
          .onClick(() => {
            this.simpleList.splice(0, 12);
          })
        Button('更新元素')
          .id('update')
          .stateEffect(true)
          .margin({ top: 10})
          .onClick(() => {
            const simpleListLength: number = this.simpleList.length;
            this.simpleList = []
            for (let i = 0; i < simpleListLength; ++i) {
              this.simpleList.push(`${i}`);
            }
          })
        Button('添加元素')
          .id('add')
          .stateEffect(true)
          .margin({ top: 10})
          .onClick(() => {
            this.simpleList.unshift('77');
          })
      }
      .height('20%')
    }
  }

}

@ComponentV2({ freezeWhenInactive: true })
struct ChildCompont {
  @Param @Require message: string = ``;
  @Local bgColor: Color = Color.Pink;
  private caseName: string = 'SUB_ACE_STATUSMANAGERV2_REPEATFREEZE_STATUSMANAGER_0010';
  @Monitor(`message`)
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      console.info(`${this.caseName} ${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`);
      if(Number(monitor.value(path)?.now)  <= 11) {
        this.bgColor = Color.Blue;
      }
      if(Number(monitor.value(path)?.now)  === 77) {
        this.bgColor = Color.Yellow;
      }
    })
  }

  build() {
    Text(`[a] ${this.message}`)
      .fontSize(20)
      .height('10%')
      .backgroundColor(this.bgColor)
  }
}