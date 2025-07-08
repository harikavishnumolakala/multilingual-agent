context {
  output name_en: string = "";
  output location_en: string = "";
  output name_te: string = "";
  output location_te: string = "";
  output name_hi: string = "";
  output location_hi: string = "";
}

start node root {
  do {
    #sayText("Welcome to HelpU onboarding. Press 1 for Hindi, 2 for Telugu, 3 for English.");
    wait *;
  }
  transitions {
    hindi: goto onboarding_hindi on #getMessageText() == "1";
    telugu: goto onboarding_telugu on #getMessageText() == "2";
    english: goto onboarding_english on #getMessageText() == "3";
    default: goto onboarding_english on true;
  }
}

node onboarding_english {
  do {
    #sayText("What is your full name?");
    wait *;
  }
  transitions {
    location: goto location_en on #getMessageText() is not null;
  }
  onexit {
    location: do {
      set $name_en = #getMessageText();
    }
  }
}

node location_en {
  do {
    #sayText("Where are you currently located?");
    wait *;
  }
  transitions {
    end: goto end on #getMessageText() is not null;
  }
  onexit {
    end: do {
      set $location_en = #getMessageText();
    }
  }
}

node onboarding_telugu {
  do {
    #sayText("మీ పేరు ఏమిటి?");
    wait *;
  }
  transitions {
    location: goto location_te on #getMessageText() is not null;
  }
  onexit {
    location: do {
      set $name_te = #getMessageText();
    }
  }
}

node location_te {
  do {
    #sayText("మీరు ఎక్కడ నివసిస్తున్నారు?");
    wait *;
  }
  transitions {
    end: goto end on #getMessageText() is not null;
  }
  onexit {
    end: do {
      set $location_te = #getMessageText();
    }
  }
}

node onboarding_hindi {
  do {
    #sayText("आपका पूरा नाम क्या है?");
    wait *;
  }
  transitions {
    location: goto location_hi on #getMessageText() is not null;
  }
  onexit {
    location: do {
      set $name_hi = #getMessageText();
    }
  }
}

node location_hi {
  do {
    #sayText("आप कहाँ रहते हैं?");
    wait *;
  }
  transitions {
    end: goto end on #getMessageText() is not null;
  }
  onexit {
    end: do {
      set $location_hi = #getMessageText();
    }
  }
}

node end {
  do {
    #sayText("Thank you for completing onboarding. We will contact you soon. Goodbye!");
    exit;
  }
}
