import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;

@service({
  title: "Code Basics",
})
@server("https://code-basics.com/api", "Code Basics")
namespace CodeBasics;

@example(#{ id: 7, name: "CSS", slug: "css", learn_as: learnAs.first_language, description: "Cascading Style Sheets (CSS) allow you to lay out web pages according to given rules. Text styles, block layouts, and animations are all specified via Cascading Style Sheets\n" })
model Language {
  id: numeric;

  @minLength(1)
  name: string;

  slug: string;
  learn_as: learnAs;
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
