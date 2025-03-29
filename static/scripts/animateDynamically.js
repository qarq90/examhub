const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add("intersecting_visible");
        }
        //  else {
        //     entry.target.classList.remove("intersecting_visible");
        // }
    });
});

const hiddenElements = document.querySelectorAll(".intersecting_invisible");
hiddenElements.forEach((el) => observer.observe(el));
