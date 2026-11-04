/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0308: Circular dependency detected for identifier: x"
---*/

function* g() { yield 42; return 88 };


// Return method is "undefined".
{
  g.prototype.return = null;


  arktest.assertEQ(undefined, (() => {
    for (let x of g()) { break; }
  })());

  arktest.assertEQ(undefined, (() => {
    for (let x of g()) { break; }
  })());

  arktest.assertEQ(undefined, (() => {
    for (const x of g()) { break; }
  })());

  arktest.assertEQ(undefined, (() => {
    for (x of g()) { break; }
  })());


  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);

  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);

  arktest.expectThrow(() => {
    for (const x of g()) { throw 42; }
  }, 42);

  arktest.expectThrow(() => {
    for (x of g()) { throw 42; }
  }, 42);


  arktest.assertEQ(42, (() => {
    for (let x of g()) { return 42; }
  })());

  arktest.assertEQ(42, (() => {
    for (let x of g()) { return 42; }
  })());

  arktest.assertEQ(42, (() => {
    for (const x of g()) { return 42; }
  })());

  arktest.assertEQ(42, (() => {
    for (x of g()) { return 42; }
  })());


  arktest.assertEQ(42, eval('for (var x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (let x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (const x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (x of g()) { x; }'));


  arktest.assertEQ(42, (() => {
    let [x] = g(); return x;
  })());

  arktest.assertEQ(42, (() => {
    let [x] = g(); return x;
  })());

  arktest.assertEQ(42, (() => {
    const [x] = g(); return x;
  })());

  arktest.assertEQ(42, (() => {
    [x] = g(); return x;
  })());

  arktest.assertEQ(42,
    (([x]) => x)(g())
  );
}


// Return method is not callable.
{
  g.prototype.return = 666;


  arktest.expectThrow(() => {
    for (let x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (let x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (const x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));


  arktest.expectThrow(() => {
    for (let x of g()) { throw 666; }
  }, 666);

  arktest.expectThrow(() => {
    for (let x of g()) { throw 666; }
  }, 666);

  arktest.expectThrow(() => {
    for (const x of g()) { throw 666; }
  }, 666);

  arktest.expectThrow(() => {
    for (x of g()) { throw 666; }
  }, 666);


  arktest.expectThrow(() => {
    for (let x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (let x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (const x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));


  arktest.assertEQ(42, eval('for (var x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (let x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (const x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (x of g()) { x; }'));


  arktest.expectThrow(() => {
    let [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    let [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    const [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    (([x]) => x)(g());
  }, ((e: Error): boolean => e instanceof TypeError));
}


// Return method does not return an object.
{
  g.prototype.return = () => 666;


  arktest.expectThrow(() => {
    for (let x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (let x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (const x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (x of g()) { break; }
  }, ((e: Error): boolean => e instanceof TypeError));


  // Throw from the body of a for loop 'wins' vs throw
  // originating from a bad 'return' value.

  arktest.expectThrow(() => {
    for (let x of g()) { throw 666; }
  }, 666);

  arktest.expectThrow(() => {
    for (let x of g()) { throw 666; }
  }, 666);

  arktest.expectThrow(() => {
    for (const x of g()) { throw 666; }
  }, 666);

  arktest.expectThrow(() => {
    for (x of g()) { throw 666; }
  }, 666);


  arktest.expectThrow(() => {
    for (let x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (let x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (const x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    for (x of g()) { return 666; }
  }, ((e: Error): boolean => e instanceof TypeError));


  arktest.assertEQ(42, eval('for (var x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (let x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (const x of g()) { x; }'));

  arktest.assertEQ(42, eval('for (x of g()) { x; }'));


  arktest.expectThrow(() => {
    let [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    let [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    const [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    [x] = g(); return x;
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(() => {
    (([x]) => x)(g());
  }, ((e: Error): boolean => e instanceof TypeError));
}


// Return method returns an object.
{
  let log = [];
  g.prototype.return = (...args) => { log.push(args); return {} };


  log = [];
  for (let x of g()) { break; }
  arktest.assertEQ([[]], log);

  log = [];
  for (let x of g()) { break; }
  arktest.assertEQ([[]], log);

  log = [];
  for (const x of g()) { break; }
  arktest.assertEQ([[]], log);

  log = [];
  for (x of g()) { break; }
  arktest.assertEQ([[]], log);


  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (const x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);


  log = [];
  arktest.assertEQ(42, (() => {
    for (let x of g()) { return 42; }
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    for (let x of g()) { return 42; }
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    for (const x of g()) { return 42; }
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    for (x of g()) { return 42; }
  })());
  arktest.assertEQ([[]], log);


  log = [];
  arktest.assertEQ(42, eval('for (var x of g()) { x; }'));
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, eval('for (let x of g()) { x; }'));
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, eval('for (const x of g()) { x; }'));
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, eval('for (x of g()) { x; }'));
  arktest.assertEQ([], log);


  // Even if doing the assignment throws, still call return
  log = [];
  x = { set attr(_) { throw 1234; } };
  arktest.expectThrow(() => {
    for (x.attr of g()) { throw 456; }
  }, 1234);
  arktest.assertEQ([[]], log);


  log = [];
  arktest.assertEQ(42, (() => {
    let [x] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    let [x] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    const [x] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    [x] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = []
  arktest.assertEQ(42,
    (([x]) => x)(g())
  );
  arktest.assertEQ([[]], log);


  log = [];
  arktest.assertEQ(42, (() => {
    let [x,] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    let [x,] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    const [x,] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ(42, (() => {
    [x,] = g(); return x;
  })());
  arktest.assertEQ([[]], log);

  log = []
  arktest.assertEQ(42,
    (([x,]) => x)(g())
  );
  arktest.assertEQ([[]], log);


  log = [];
  arktest.assertEQ(42, (() => {
    let [x,,] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, (() => {
    let [x,,] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, (() => {
    const [x,,] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, (() => {
    [x,,] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = []
  arktest.assertEQ(42,
    (([x,,]) => x)(g())
  );
  arktest.assertEQ([], log);


  log = [];
  arktest.assertEQ([42, undefined], (() => {
    let [x, y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, undefined], (() => {
    let [x, y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, undefined], (() => {
    const [x, y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, undefined], (() => {
    [x, y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = []
  arktest.assertEQ([42, undefined],
    (([x, y]) => [x, y])(g())
  );
  arktest.assertEQ([], log);


  log = [];
  arktest.assertEQ([42], (() => {
    let [...x] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42], (() => {
    let [...x] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42], (() => {
    const [...x] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42], (() => {
    [...x] = g(); return x;
  })());
  arktest.assertEQ([], log);

  log = []
  arktest.assertEQ([42],
    (([...x]) => x)(g())
  );
  arktest.assertEQ([], log);


  log = [];
  arktest.assertEQ([42, []], (() => {
    let [x, ...y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, []], (() => {
    let [x, ...y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, []], (() => {
    const [x, ...y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, []], (() => {
    [x, ...y] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = []
  arktest.assertEQ([42, []],
    (([x, ...y]) => [x, y])(g())
  );
  arktest.assertEQ([], log);


  log = [];
  arktest.assertEQ([], (() => {
    let [] = g(); return [];
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ([], (() => {
    let [] = g(); return [];
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ([], (() => {
    const [] = g(); return [];
  })());
  arktest.assertEQ([[]], log);

  log = [];
  arktest.assertEQ([], (() => {
    [] = g(); return [];
  })());
  arktest.assertEQ([[]], log);

  log = []
  arktest.assertEQ([],
    (([]) => [])(g())
  );
  arktest.assertEQ([[]], log);


  log = [];
  arktest.assertEQ([], (() => {
    let [...[]] = g(); return [];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([], (() => {
    let [...[]] = g(); return [];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([], (() => {
    const [...[]] = g(); return [];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([], (() => {
    [...[]] = g(); return [];
  })());
  arktest.assertEQ([], log);

  log = []
  arktest.assertEQ([],
    (([...[]]) => [])(g())
  );
  arktest.assertEQ([], log);


  log = [];
  arktest.assertEQ([42], (() => {
    let [...[x]] = g(); return [x];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42], (() => {
    let [...[x]] = g(); return [x];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42], (() => {
    const [...[x]] = g(); return [x];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42], (() => {
    [...[x]] = g(); return [x];
  })());
  arktest.assertEQ([], log);

  log = []
  arktest.assertEQ([42],
    (([...[x]]) => [x])(g())
  );
  arktest.assertEQ([], log);


  log = [];
  arktest.assertEQ([42, undefined], (() => {
    let [...[x, y]] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, undefined], (() => {
    let [...[x, y]] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, undefined], (() => {
    const [...[x, y]] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ([42, undefined], (() => {
    [...[x, y]] = g(); return [x, y];
  })());
  arktest.assertEQ([], log);

  log = []
  arktest.assertEQ([42, undefined],
    (([...[x, y]]) => [x, y])(g())
  );
  arktest.assertEQ([], log);


  log = []
  arktest.expectThrow(() => {
    let x = { set foo(_) { throw 666; } };
    [x.foo] = g();
  }, 666);
  arktest.assertEQ([[]], log);


  log = []
  arktest.expectThrow(() => {
    let [[]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([[]], log);

  log = []
  arktest.expectThrow(() => {
    let [[]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([[]], log);

  log = []
  arktest.expectThrow(() => {
    const [[]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([[]], log);

  log = []
  arktest.expectThrow(() => {
    [[]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([[]], log);

  log = []
  arktest.expectThrow(() => {
    (([[]]) => 0)(g());
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([[]], log);


  log = []
  arktest.expectThrow(() => {
    let [...[[]]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([], log);

  log = []
  arktest.expectThrow(() => {
    let [...[[]]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([], log);

  log = []
  arktest.expectThrow(() => {
    const [...[[]]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([], log);

  log = []
  arktest.expectThrow(() => {
    [...[[]]] = g();
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([], log);

  log = []
  arktest.expectThrow(() => {
    (([...[[]]]) => 0)(g());
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([], log);


  {
    let backup = Array.prototype[Symbol.iterator];
    Array.prototype[Symbol.iterator] = () => g();


    log = [];
    arktest.expectNoThrow(() => {
      let [x, ...[y]] = [1, 2, 3]
    });
    arktest.assertEQ(log, [[]]);

    log = [];
    arktest.expectNoThrow(() => {
      let [x, ...[y]] = [1, 2, 3];
    });
    arktest.assertEQ(log, [[]]);

    log = [];
    arktest.expectNoThrow(() => {
      const [x, ...[y]] = [1, 2, 3];
    });
    arktest.assertEQ(log, [[]]);

    log = [];
    arktest.expectNoThrow(() => {
      (([x, ...[y]]) => {})([1, 2, 3]);
    });
    arktest.assertEQ(log, [[]]);


    log = [];
    arktest.expectThrow(() => {
      let [x, ...[[]]] = [1, 2, 3];
    }, ((e: Error): boolean => e instanceof TypeError));
    arktest.assertEQ(log, [[]]);

    log = [];
    arktest.expectThrow(() => {
      let [x, ...[[]]] = [1, 2, 3];
    }, ((e: Error): boolean => e instanceof TypeError));
    arktest.assertEQ(log, [[]]);

    log = [];
    arktest.expectThrow(() => {
      const [x, ...[[]]] = [1, 2, 3];
    }, ((e: Error): boolean => e instanceof TypeError));
    arktest.assertEQ(log, [[]]);

    log = [];
    arktest.expectThrow(() => {
      (([x, ...[[]]]) => {})([1, 2, 3]);
    }, ((e: Error): boolean => e instanceof TypeError));
    arktest.assertEQ(log, [[]]);


    log = [];
    arktest.expectNoThrow(() => {
      let [x, ...[...y]] = [1, 2, 3];
    });
    arktest.assertEQ(log, []);

    log = [];
    arktest.expectNoThrow(() => {
      let [x, ...[...y]] = [1, 2, 3];
    });
    arktest.assertEQ(log, []);

    log = [];
    arktest.expectNoThrow(() => {
      const [x, ...[...y]] = [1, 2, 3];
    });
    arktest.assertEQ(log, []);

    log = [];
    arktest.expectNoThrow(() => {
      (([x, ...[...y]]) => {})([1, 2, 3]);
    });
    arktest.assertEQ(log, []);


    Array.prototype[Symbol.iterator] = backup;
  }
}


// Return method throws.
{
  let log = [];
  g.prototype.return = (...args) => { log.push(args); throw 23 };


  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { break; }
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { break; }
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (const x of g()) { break; }
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (x of g()) { break; }
  }, 23);
  arktest.assertEQ([[]], log);


  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (const x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (x of g()) { throw 42; }
  }, 42);
  arktest.assertEQ([[]], log);


  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { return 42; }
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g()) { return 42; }
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (const x of g()) { return 42; }
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    for (x of g()) { return 42; }
  }, 23);
  arktest.assertEQ([[]], log);


  log = [];
  arktest.assertEQ(42, eval('for (var x of g()) { x; }'));
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, eval('for (let x of g()) { x; }'));
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, eval('for (const x of g()) { x; }'));
  arktest.assertEQ([], log);

  log = [];
  arktest.assertEQ(42, eval('for (x of g()) { x; }'));
  arktest.assertEQ([], log);


  log = [];
  arktest.expectThrow(() => {
    let [x] = g(); return x;
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    let [x] = g(); return x;
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    const [x] = g(); return x;
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    [x] = g(); return x;
  }, 23);
  arktest.assertEQ([[]], log);

  log = [];
  arktest.expectThrow(() => {
    (([x]) => x)(g())
  }, 23);
  arktest.assertEQ([[]], log);
}


// Next method throws.
{
  let closed = false;
  g.prototype.next = () => { throw 666; };
  g.prototype.return = () => { closed = true; };


  arktest.expectThrow(() => {
    for (let x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (let x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (const x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    let [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    let [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    const [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    (([x]) => x)(g());
  }, 666);

  arktest.expectThrow(() => {
    let [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    let [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    const [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    (([...x]) => x)(g());
  }, 666);


  arktest.assertFalse(closed);
}


// Value throws.
{
  let closed = false;
  g.prototype.next = () => ({get value() {throw 666}});
  g.prototype.return = () => { closed = true; };


  arktest.expectThrow(() => {
    for (let x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (let x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (const x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    let [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    let [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    const [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    (([x]) => x)(g());
  }, 666);

  arktest.expectThrow(() => {
    let [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    let [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    const [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    (([...x]) => x)(g());
  }, 666);


  arktest.assertFalse(closed);
}


// Done throws.
{
  let closed = false;
  g.prototype.next = () => ({get done() {throw 666}});
  g.prototype.return = () => { closed = true; };


  arktest.expectThrow(() => {
    for (let x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (let x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (const x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    for (x of g()) {}
  }, 666);

  arktest.expectThrow(() => {
    let [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    let [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    const [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    [x] = g();
  }, 666);

  arktest.expectThrow(() => {
    (([x]) => x)(g());
  }, 666);

  arktest.expectThrow(() => {
    let [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    let [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    const [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    [...x] = g();
  }, 666);

  arktest.expectThrow(() => {
    (([...x]) => x)(g());
  }, 666);


  arktest.assertFalse(closed);
}


// Nested loops.
{
  function* g1() { yield 1; yield 2; throw 3; }
  function* g2() { yield -1; yield -2; throw -3; }

  arktest.expectNoThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          break;
        }
      }
      if (x == 2) {
        break;
      }
    }
  }, -3);

  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
      }
    }
  }, -3);

  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          break;
        }
      }
    }
  }, 3);

  arktest.expectNoThrow(() => {
    l: for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          break l;
        }
      }
    }
  });

  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        throw 4;
      }
    }
  }, 4);

  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          throw 4;
        }
      }
    }
  }, 4);

  let log = [];
  g1.prototype.return = () => { log.push(1); throw 5 };
  g2.prototype.return = () => { log.push(2); throw -5 };

  log = [];
  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          break;
        }
      }
      if (x == 2) {
        break;
      }
    }
  }, -5);
  arktest.assertEQ([2, 1], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
      }
    }
  }, -3);
  arktest.assertEQ([1], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          break;
        }
      }
    }
  }, -5);
  arktest.assertEQ([2, 1], log);

  log = [];
  arktest.expectThrow(() => {
    l: for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          break l;
        }
      }
    }
  }, -5);
  arktest.assertEQ([2, 1], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        throw 4;
      }
    }
  }, 4);
  arktest.assertEQ([2, 1], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g1()) {
      for (let y of g2()) {
        if (y == -2) {
          throw 4;
        }
      }
    }
  }, 4);
  arktest.assertEQ([2, 1], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g1()) {
      try {
        for (let y of g2()) {
        }
      } catch (_) {}
    }
  }, 3);
  arktest.assertEQ([], log);

  log = [];
  arktest.expectThrow(() => {
    for (let x of g1()) {
      try {
        for (let y of g2()) {
        }
      } catch (_) {}
      if (x == 2) {
        break;
      }
    }
  }, 5);
  arktest.assertEQ([1], log);
}


// yield*, argument's return method is "undefined".
function testYieldStarWithoutReturn(getIterable) {
  arktest.assertTrue(getIterable().return == undefined);

  function* g() { yield* getIterable() }

  {
    let gen = g();
    arktest.assertEQ({value: 1, done: false}, gen.next());
    arktest.assertEQ({value: undefined, done: true}, gen.return());
  }

  arktest.assertEQ(42, (() => {
    for (let x of g()) {
      break;
    }
    return 42;
  })());

  arktest.assertEQ(42, (() => {
    for (let x of g()) {
      return 42;
    }
  })());

  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);
}
{
  let getIterable1 = () => [1, 2];
  let getIterable2 = function*() { yield 1; yield 2 };
  getIterable2.prototype.return = null;
  testYieldStarWithoutReturn(getIterable1);
  testYieldStarWithoutReturn(getIterable2);
}


// yield*, argument's return method is defined.
{
  let getIterable = function*() { yield 1; yield 2 };
  const obj = {};
  getIterable.prototype.return = (...args) => obj;

  function* g() { yield* getIterable() }

  {
    let gen = g();
    arktest.assertEQ({value: 1, done: false}, gen.next());
    arktest.assertEQ(obj, gen.return());
    arktest.assertEQ(obj, gen.return());
    arktest.assertEQ(obj, gen.return());
    arktest.assertEQ({value: 2, done: false}, gen.next());
    arktest.assertEQ(obj, gen.return());
    arktest.assertEQ(obj, gen.return());
    arktest.assertEQ(obj, gen.return());
    arktest.assertEQ({value: undefined, done: true}, gen.next());
    arktest.assertEQ({value: undefined, done: true}, gen.return());
    arktest.assertEQ({value: undefined, done: true}, gen.return());
  }

  arktest.assertEQ(42, (() => {
    for (let x of g()) {
      break;
    }
    return 42;
  })());

  arktest.assertEQ(42, (() => {
    for (let x of g()) {
      return 42;
    }
  })());

  arktest.expectThrow(() => {
    for (let x of g()) { throw 42; }
  }, 42);
}
