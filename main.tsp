import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;

@service({
  title: "Code Basics",
})
@server("https://code-basics.com/api", "Code Basics")
namespace CodeBasics;

model Language {
  @example(7)
  id: numeric;

  @example("CSS")
  @minLength(1)
  name: string;

  @example("css")
  slug: string;

  @example(learnAs.first_language)
  learn_as: learnAs;

  @example("Cascading Style Sheets (CSS) allow you to lay out web pages according to given rules...")
  description: string;
}

model Lesson {
  id: numeric;
  name: string;
  slug: string;
  natural_order: numeric;
}

enum learnAs {
  first_language,
  second_language,
}

@error
model NotFoundError {
  code: "NOT_FOUND";
  message: string;
}

@route("languages")
namespace Languages {
  @get
  op index(): {
    @body languages: {
      data: Language[];
    };
  };

  @get
  op show(@path id: numeric): {
    @body language: Language;
  } | {
    @body error: NotFoundError;
  };
}
